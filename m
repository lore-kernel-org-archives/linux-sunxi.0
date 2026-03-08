Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CDB310636;
	Sun,  8 Mar 2026 09:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772962193; cv=none; b=jyDsmWtGNhA5fSWnrVhgylJctiDA22aRzZT4kbsD120EPS08yrKo7SOu5Xq2FJo6XkbYSioN38xFIxXfuhiTOofo0KFI+UrOSd+bDKzaPGc0ShjZJ6wL1l8P2ok6fIYrDwiPWkH0sE77x7jMcw4bhD1laPSDAMRm+GwJMARLXJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772962193; c=relaxed/simple;
	bh=KNtC0q+0xMvJCzT0C7XZiEo83A1+jyGBbiWTjn+sXvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMloZYsrNcido8889iwR6Pax2U7k5IMYCml7Emmfl+cNWu9PeIZMGj2IRSfzbGRSZRZhglU/J3t57pvBxtQJaJ48tLuFzz2d7RuTAIsOLCxT1LktXQ/YV4O1/UqJsG6iwBywDDvSMt79VSA3xGiwDroOC/SpOqsuC8/IwGulGhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=hWPI4PB8; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="hWPI4PB8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=86hYbeqBpa+IqwT6izW3XEUpWd5gwJBC/FRc7SCtNBs=; b=hWPI4PB8skrCj2koZxKDebm7xi
	fSt3bsxQ96vrdTcxc/2PhOw5uON7PAeLfNCVdDBA45EqkUOqmAJ+pZzvlgJKrA3TLdWwacJPqJQWt
	T2pzI0fUCz1TJyTXWBcyODdsD9FnzRdmJsLcZhQKEYglW5ZSHgnQk2+YTbFebjqs2XUXeJ09+V4P8
	G8FVXGtPEpT6NtSK6q9ec77K5gXUAuhxZWZo2ToQntHARSMJUYsEtRayB2kDI0ac/S6z2IVcKP8Lp
	xqQn7vj9d1dEVEM2+iTUd6T7TjXkhGVoJ3rp4keTIwtYNFxyelnhHqzBhNC1Uj4JdzRLmg/dm4yE8
	+u4DfoTw==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1vzASI-0000000D7iN-0DUh;
	Sun, 08 Mar 2026 10:29:46 +0100
Date: Sun, 8 Mar 2026 10:29:44 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: allwinner: fix Orange Pi Zero 3 PMIC
 interrupt routing
Message-ID: <ivcvl5srlbxmfqc7nxuic4goosstb3aqsu22776jwuacvb2iit@65amwdvjy3bi>
References: <20260308-rc2-boot-hang-v1-0-d792d1a78dfd@mmpsystems.pl>
 <3404622.44csPzL39Z@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3404622.44csPzL39Z@jernej-laptop>
X-Authenticated-Id: michal.piekos@mmpsystems.pl

On Sun, Mar 08, 2026 at 09:23:01AM +0100, Jernej Škrabec wrote:
> Hi Michal,
> 
> Dne nedelja, 8. marec 2026 ob 06:16:50 Srednjeevropski standardni čas je Michal Piekos napisal(a):
> > This fixes a kernel hang during boot on the Orange Pi Zero 3 caused by
> > incorrect interrupt routing for the AXP313A PMIC.
> > 
> > The PMIC interrupt on is connected to PL bank GPIO handled by the R_PIO
> > controller. However current dts routes the interrupts to PIO controller.
> > This causes the kernel to select wrong pinctrl instance when configuring
> > the interrupt which leads to invalid register access and a kernel hang
> > during boot.
> 
> Where did you get that info? Publicly available schematic clearly shows
> PMIC interrupt pin being connected to PC9. Additionally, R_PIO controller
> on H616 is very basic and has only pins PL0 and PL1, which are used for
> PMIC communication already. Neither of those pins is interrupt capable.
> 

You are right; I was too quick with reasoning. I will rework it or drop
patch 1.

> > 
> > The problem existed previously but became visible after the commit
> > 01e10d0272b9 (pinctrl: sunxi: Implement gpiochip::get_direction()),
> > which causes gpiolib to call the gpiochip::get_direction() callback
> > during interrupt setup.
> 
> I think proposed solution just bypasses the problem, not actually fixes
> it. Can you share kernel crash report?
> 

Yes that is correct. The underlying problem is that
gpiochip::get_direction() is called with wrong chip which is causing the
hang. The wrong chip is assumed as it is inferred from
interrupt-parrent which in this case is faulty reasoning.
I will propose proper correction.
Full serial log:

U-Boot SPL 2026.01 (Feb 21 2026 - 09:15:11 +0100)
DRAM: 1024 MiB
Trying to boot from MMC1
NOTICE:  BL31: v2.14.0(release):sandbox/v2.14-462-g1a7dbe28d
NOTICE:  BL31: Built : 09:13:18, Feb 21 2026
NOTICE:  BL31: Detected Allwinner H616 SoC (1823)
NOTICE:  BL31: Found U-Boot DTB at 0x4a0bb428, model: OrangePi Zero3


U-Boot 2026.01 (Feb 21 2026 - 09:15:11 +0100) Allwinner Technology

CPU:   Allwinner H616 (SUN50I)
Model: OrangePi Zero3
DRAM:  1 GiB
Core:  60 devices, 25 uclasses, devicetree: separate
WDT:   Not starting watchdog@30090a0
MMC:   mmc@4020000: 0
Loading Environment from FAT... OK
In:    serial@5000000
Out:   serial@5000000
Err:   serial@5000000
Allwinner mUSB OTG (Peripheral)
Net:   eth0: ethernet@5020000using musb-hdrc, OUT ep1out IN ep1in STATUS ep2in
MAC de:ad:be:ef:00:01
HOST MAC de:ad:be:ef:00:00
RNDIS ready
, eth1: usb_ether
starting USB...
USB EHCI 1.00
USB OHCI 1.0
Bus usb@5200000: 1 USB Device(s) found
Bus usb@5200400: 1 USB Device(s) found
       scanning usb for storage devices... 0 Storage Device(s) found
Hit any key to stop autoboot: 0
BOOTP broadcast 1
DHCP client bound to address 192.168.1.36 (2 ms)
Retrieving file: /boot/extlinux/extlinux.conf
Kernel Lab Boot Menu
1:	Debian
2:	Debian Edge
3:	Buildroot (NFS rootfs)
4:	Debian (single-user debug)
Enter choice: 2:	Debian Edge
Retrieving file: /boot/Image
append: console=ttyS0,115200 earlycon root=/dev/mmcblk0p2 rootwait rw rootfstype=ext4 loglevel=8 ignore_loglevel
Retrieving file: /boot/sun50i-h618-orangepi-zero3.dtb
Moving Image from 0x40080000 to 0x40200000, end=0x43540000
## Flattened Device Tree blob at 4fa00000
   Booting using the fdt blob at 0x4fa00000
Working FDT set to 4fa00000
   Loading Device Tree to 0000000049ff7000, end 0000000049fff862 ... OK
Working FDT set to 49ff7000

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
[    0.000000] Linux version 7.0.0-rc2-00532-gc23719abc330 (michal@aorus) (aarch64-linux-gnu-gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0, GNU ld (GNU Binutils for Ubuntu) 2.42) #47 SMP PREEMPT Sun Mar  8 10:07:53 CET 2026
[    0.000000] KASLR disabled due to lack of seed
[    0.000000] Machine model: OrangePi Zero3
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.000000] efi: UEFI not found.
[    0.000000] earlycon: uart0 at MMIO32 0x0000000005000000 (options '115200n8')
[    0.000000] printk: legacy bootconsole [uart0] enabled
[    0.000000] OF: reserved mem: 0x0000000040000000..0x000000004003ffff (256 KiB) nomap non-reusable secmon@40000000
[    0.000000] NUMA: Faking a node at [mem 0x0000000040000000-0x000000007fffffff]
[    0.000000] NODE_DATA(0) allocated [mem 0x7fdea6c0-0x7fdecd3f]
[    0.000000] cma: Reserved 32 MiB at 0x000000007dc00000
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.5
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000040000000-0x000000007fffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000040000000-0x000000004003ffff]
[    0.000000]   node   0: [mem 0x0000000040040000-0x000000007fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x000000007fffffff]
[    0.000000] percpu: Embedded 25 pages/cpu s63256 r8192 d30952 u102400
[    0.000000] pcpu-alloc: s63256 r8192 d30952 u102400 alloc=25*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: detected: ARM erratum 845719
[    0.000000] alternatives: applying boot alternatives
[    0.000000] Kernel command line: console=ttyS0,115200 earlycon root=/dev/mmcblk0p2 rootwait rw rootfstype=ext4 loglevel=8 ignore_loglevel
[    0.000000] printk: log buffer data + meta data: 131072 + 458752 = 589824 bytes
[    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.000000] software IO TLB: SWIOTLB bounce buffer size adjusted to 1MB
[    0.000000] software IO TLB: area num 4.
[    0.000000] software IO TLB: mapped [mem 0x000000007ca80000-0x000000007cb80000] (1MB)
[    0.000000] Fallback order for Node 0: 0
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 262144
[    0.000000] Policy zone: DMA
[    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=512 to nr_cpu_ids=4.
[    0.000000] 	Trampoline variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] RCU Tasks: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] GIC: Using split EOI/Deactivate mode
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] arch_timer: cp15 timer running at 24.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x588fe9dc0, max_idle_ns: 440795202592 ns
[    0.000001] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps every 4398046511097ns
[    0.009899] Console: colour dummy device 80x25
[    0.014894] Calibrating delay loop (skipped), value calculated using timer frequency.. 48.00 BogoMIPS (lpj=96000)
[    0.026163] pid_max: default: 32768 minimum: 301
[    0.031485] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.039616] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.048672] VFS: Finished mounting rootfs on nullfs
[    0.055673] rcu: Hierarchical SRCU implementation.
[    0.060938] rcu: 	Max phase no-delay instances is 1000.
[    0.066894] Timer migration: 1 hierarchy levels; 8 children per group; 1 crossnode level
[    0.078590] EFI services will not be available.
[    0.083815] smp: Bringing up secondary CPUs ...
[    0.088954] Detected VIPT I-cache on CPU1
[    0.089116] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
[    0.089751] Detected VIPT I-cache on CPU2
[    0.089858] CPU2: Booted secondary processor 0x0000000002 [0x410fd034]
[    0.090431] Detected VIPT I-cache on CPU3
[    0.090538] CPU3: Booted secondary processor 0x0000000003 [0x410fd034]
[    0.090635] smp: Brought up 1 node, 4 CPUs
[    0.129373] SMP: Total of 4 processors activated.
[    0.134182] CPU: All CPU(s) started at EL2
[    0.138730] CPU features: detected: 32-bit EL0 Support
[    0.144367] CPU features: detected: 32-bit EL1 Support
[    0.149773] CPU features: detected: CRC32 instructions
[    0.155024] CPU features: detected: PMUv3
[    0.159474] alternatives: applying system-wide alternatives
[    0.167268] Memory: 938164K/1048576K available (18880K kernel code, 5414K rwdata, 14320K rodata, 12864K init, 760K bss, 74332K reserved, 32768K cma-reserved)
[    0.182668] devtmpfs: initialized
[    0.192133] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.202124] posixtimers hash table entries: 2048 (order: 3, 32768 bytes, linear)
[    0.210336] futex hash table entries: 1024 (65536 bytes on 1 NUMA nodes, total 64 KiB, linear).
[    0.220139] 19648 pages in range for non-PLT usage
[    0.220146] 511168 pages in range for PLT usage
[    0.228200] DMI not present or invalid.
[    0.240067] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.247399] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.255605] audit: initializing netlink subsys (disabled)
[    0.261713] audit: type=2000 audit(0.152:1): state=initialized audit_enabled=0 res=1
[    0.263473] thermal_sys: Registered thermal governor 'step_wise'
[    0.269758] thermal_sys: Registered thermal governor 'power_allocator'
[    0.276308] cpuidle: using governor menu
[    0.287923] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.295341] ASID allocator initialised with 65536 entries
[    0.304033] Serial: AMBA PL011 UART driver
[    0.312563] /soc/clock@3001000: Fixed dependency cycle(s) with /soc/rtc@7000000
[    0.320445] /soc/interrupt-controller@3021000: Fixed dependency cycle(s) with /soc/interrupt-controller@3021000
[    0.331202] /soc/rtc@7000000: Fixed dependency cycle(s) with /soc/clock@3001000
[    0.339080] /soc/rtc@7000000: Fixed dependency cycle(s) with /soc/clock@7010000
[    0.347068] /soc/clock@7010000: Fixed dependency cycle(s) with /soc/clock@3001000
[    0.355106] /soc/clock@7010000: Fixed dependency cycle(s) with /soc/rtc@7000000
[    0.364785] /soc/clock@3001000: Fixed dependency cycle(s) with /soc/rtc@7000000
[    0.380547] /soc/clock@3001000: Fixed dependency cycle(s) with /soc/rtc@7000000
[    0.388538] /soc/rtc@7000000: Fixed dependency cycle(s) with /soc/clock@3001000
[    0.396520] /soc/rtc@7000000: Fixed dependency cycle(s) with /soc/clock@7010000
[    0.404921] /soc/rtc@7000000: Fixed dependency cycle(s) with /soc/clock@7010000
[    0.412983] /soc/clock@7010000: Fixed dependency cycle(s) with /soc/clock@3001000
[    0.421238] /soc/clock@7010000: Fixed dependency cycle(s) with /soc/rtc@7000000
[    0.434376] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.441844] HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
[    0.448576] HugeTLB: registered 32.0 MiB page size, pre-allocated 0 pages
[    0.456019] HugeTLB: 0 KiB vmemmap can be freed for a 32.0 MiB page
[    0.462832] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.469885] HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
[    0.476767] HugeTLB: registered 64.0 KiB page size, pre-allocated 0 pages
[    0.484166] HugeTLB: 0 KiB vmemmap can be freed for a 64.0 KiB page
[    0.492641] ACPI: Interpreter disabled.
[    0.499750] iommu: Default domain type: Translated
[    0.505021] iommu: DMA domain TLB invalidation policy: strict mode
[    0.512091] SCSI subsystem initialized
[    0.516340] libata version 3.00 loaded.
[    0.520716] usbcore: registered new interface driver usbfs
[    0.526667] usbcore: registered new interface driver hub
[    0.532409] usbcore: registered new device driver usb
[    0.538461] pps_core: LinuxPPS API ver. 1 registered
[    0.543630] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.553464] PTP clock support registered
[    0.557542] EDAC MC: Ver: 3.0.0
[    0.561339] scmi_core: SCMI protocol bus registered
[    0.567457] FPGA manager framework
[    0.572424] vgaarb: loaded
[    0.575792] clocksource: Switched to clocksource arch_sys_counter
[    0.582765] VFS: Disk quotas dquot_6.6.0
[    0.586740] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.594945] pnp: PnP ACPI: disabled
[    0.606909] NET: Registered PF_INET protocol family
[    0.612416] IP idents hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.621561] tcp_listen_portaddr_hash hash table entries: 512 (order: 1, 8192 bytes, linear)
[    0.629937] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.638451] TCP established hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.646283] TCP bind hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.654509] TCP: Hash tables configured (established 8192 bind 8192)
[    0.661585] UDP hash table entries: 512 (order: 3, 32768 bytes, linear)
[    0.668898] UDP-Lite hash table entries: 512 (order: 3, 32768 bytes, linear)
[    0.676805] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.683458] RPC: Registered named UNIX socket transport module.
[    0.689969] RPC: Registered udp transport module.
[    0.694702] RPC: Registered tcp transport module.
[    0.699859] RPC: Registered tcp-with-tls transport module.
[    0.705355] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.712439] PCI: CLS 0 bytes, default 64
[    0.721852] kvm [1]: nv: 570 coarse grained trap handlers
[    0.727731] kvm [1]: nv: 664 fine grained trap handlers
[    0.733606] kvm [1]: IPA Size Limit: 40 bits
[    0.741726] kvm [1]: vgic interrupt IRQ9
[    0.746076] kvm [1]: Hyp nVHE mode initialized successfully
[    0.753903] Initialise system trusted keyrings
[    0.758988] workingset: timestamp_bits=42 max_order=18 bucket_order=0
[    0.766433] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.773154] NFS: Registering the id_resolver key type
[    0.778254] Key type id_resolver registered
[    0.782851] Key type id_legacy registered
[    0.787277] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.794642] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
[    0.802958] 9p: Installing v9fs 9p2000 file system support
[    0.872556] Key type asymmetric registered
[    0.877059] Asymmetric key parser 'x509' registered
[    0.882488] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 244)
[    0.890615] io scheduler mq-deadline registered
[    0.895592] io scheduler kyber registered
[    0.900050] io scheduler bfq registered
[    0.916197] ledtrig-cpu: registered to indicate activity on CPUs
[    0.965921] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.977006] msm_serial: driver initialized
[    0.981770] SuperH (H)SCI(F) driver initialized
[    0.986698] STM32 USART driver initialized
[    1.001183] loop: module loaded
[    1.005974] megasas: 07.734.00.00-rc1
[    1.017575] tun: Universal TUN/TAP device driver, 1.6
[    1.023927] thunder_xcv, ver 1.0
[    1.027224] thunder_bgx, ver 1.0
[    1.030816] nicpf, ver 1.0
[    1.035271] e1000: Intel(R) PRO/1000 Network Driver
[    1.040627] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    1.046990] e1000e: Intel(R) PRO/1000 Network Driver
[    1.052443] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    1.058977] igb: Intel(R) Gigabit Ethernet Network Driver
[    1.064508] igb: Copyright (c) 2007-2014 Intel Corporation.
[    1.070437] igbvf: Intel(R) Gigabit Virtual Function Network Driver
[    1.077264] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    1.084131] sky2: driver version 1.30
[    1.090086] VFIO - User Level meta-driver version: 0.3
[    1.099412] usbcore: registered new interface driver usb-storage
[    1.110449] sun6i-rtc 7000000.rtc: registered as rtc0
[    1.115911] sun6i-rtc 7000000.rtc: setting system clock to 2026-03-08T09:08:59 UTC (1772960939)
[    1.126106] i2c_dev: i2c /dev entries driver
[    1.138276] sdhci: Secure Digital Host Controller Interface driver
[    1.145070] sdhci: Copyright(c) Pierre Ossman
[    1.150698] Synopsys Designware Multimedia Card Interface Driver
[    1.157886] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.167270] SMCCC: SOC_ID: ID = jep106:091e:1823 Revision = 0x00000002
[    1.175365] usbcore: registered new interface driver usbhid
[    1.181488] usbhid: USB HID core driver
[    1.189657] hw perfevents: enabled with armv8_cortex_a53 PMU driver, 7 (0,8000003f) counters available
[    1.205610] NET: Registered PF_PACKET protocol family
[    1.211275] 9pnet: Installing 9P2000 support
[    1.216068] Key type dns_resolver registered
[    1.234163] registered taskstats version 1
[    1.238657] Loading compiled-in X.509 certificates
[    1.254844] Demotion targets for Node 0: null
[    1.273747] gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    1.283903] sun50i-h616-r-pinctrl 7022000.pinctrl: initialized sunXi PIO driver
[    1.310185] sun50i-h616-r-pinctrl 7022000.pinctrl: supply vcc-pl not found, using dummy regulator
[    1.321037] /soc/i2c@7081400/pmic@36: Fixed dependency cycle(s) with /soc/pinctrl@300b000
[    1.344208] gpio gpiochip1: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    1.362643] sun50i-h616-pinctrl 300b000.pinctrl: initialized sunXi PIO driver
[    1.375624] dw-apb-uart 5000000.serial: Error applying setting, reverse things back
[    1.385971] sun6i-spi 5010000.spi: Error applying setting, reverse things back
[    1.404383] axp20x-i2c 0-0036: AXP20x variant AXP313a found
[    1.412083] gpio gpiochip1: (300b000.pinctrl): gpiochip_lock_as_irq: cannot get GPIO direction
[    1.421570] sun50i-h616-pinctrl 300b000.pinctrl: unable to lock HW IRQ 41 for IRQ
[    1.429793] genirq: Failed to request resources for axp313a_irq_chip (irq 72) on irqchip sunxi_pio_edge
[    1.439242] axp20x-i2c 0-0036: Failed to request IRQ 72 for axp313a_irq_chip: -19
[    1.447073] axp20x-i2c 0-0036: failed to add irq chip: -19
[    1.465663] dw-apb-uart 5000000.serial: Error applying setting, reverse things back
[    1.476091] sun6i-spi 5010000.spi: Error applying setting, reverse things back
[    1.500846] clk: Disabling unused clocks


> Sidenote: Tested-by: tag doesn't have any value if you're also the author
> of the patch. It's already implied that you tested your solution/improvements.
> 
> Best regards,
> Jernej
> 
> > 
> > Patch 1 declares R_PIO node as interrupt controller so it can be used as
> > interrupt parrent.
> > 
> > Patch 2 fixes the board device tree by routing the interrupt to R_PIO
> > 
> > ---
> > Michal Piekos (2):
> >       arm64: dts: allwinner: h616: declare r_pio as interrupt controller
> >       arm64: dts: allwinner: orangepi-zero3: fix axp313 interrupt parrent
> > 
> >  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi               | 2 ++
> >  arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts | 2 +-
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> > ---
> > base-commit: 4ae12d8bd9a830799db335ee661d6cbc6597f838
> > change-id: 20260308-rc2-boot-hang-269e8546635b
> > 
> > Best regards,
> > 
> 
> 
> 
> 
