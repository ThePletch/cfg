[.[0], (.[0].installed_packages + .[1].installed_packages | unique | {installed_packages: .})] | .[0] * .[1]
