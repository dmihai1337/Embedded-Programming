import errno
import logging
import os
import typing as t


class Config(dict):
    """ dict-accessible configuration with yaml import/export options

        Further items may be added during runtime, keys starting with '_'
        are treated as runtime configuration options and won't be saved to disk.
    """

    def __init__(self, root_path: str, defaults: t.Optional[dict] = None) -> None:
        super().__init__(defaults or {})
        self.root_path = root_path

    def write_yml(self, filename: str):
        """ write configuration to <filename>, omitting all keys starting with '_'
            path is given on init
        """

        import yaml
        filename = os.path.join(self.root_path, filename)

        with open(filename, "w") as f:
            d = yaml.safe_load(repr(self))
            to_remove = []
            for k in d:
                if d[k] == "None" or k.startswith("_"):
                    to_remove.append(k)
            for key in to_remove:
                d.pop(key)
            logging.debug(f"saving config: {d}")
            yaml.dump(d, f)

    def from_yml(self, filename: str, silent: bool = False) -> bool:
        """ read configuration from <filename>, path is given on init """

        import yaml

        filename = os.path.join(self.root_path, filename)

        try:
            with open(filename) as f:
                obj = yaml.safe_load(f)
        except OSError as e:
            if silent and e.errno in (errno.ENOENT, errno.EISDIR):
                return False

            e.strerror = f"Unable to load configuration file from ({e.strerror})"
            raise

        return self.from_mapping(obj)

    def from_mapping(self, mapping: t.Optional[t.Mapping[str, t.Any]] = None, **kwargs: t.Any) -> bool:
        """ add items from dict-like object """

        mappings: t.Dict[str, t.Any] = {}
        map_filt = mapping
        if kwargs.pop("ignore_none", False):
            map_filt = dict(filter(lambda d: d[1] is not None, mapping.items()))

        if map_filt is not None:
            mappings.update(map_filt)
        mappings.update(kwargs)
        for key, item in mappings.items():
            self[key] = item

        return True
