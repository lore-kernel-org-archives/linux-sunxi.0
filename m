Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E3B3546FF
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Sep 2026 18:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461775; cv=pass; b=YoJbpoUD8AOHg0ElHJ2rDyEzWSxRGasbqCxKfwhkE2mqa2F8lTFJA55Af9kAA+rEzxCc+DPEQp8xLJv2p8Oo4codmCAdKCnzC2lD+q7+R/XlRNnsH9LQICJreiDt8AGqaHTx0HC4h0bg+tCpaar37IIifJ0RO8CYc544CUKytx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461775; c=relaxed/simple;
	bh=PvGPM92pAWPfnhuZLqhuou6zjC5m6M62hnp+2pSaCy0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=U9ljEKjghcd5dHehyIHntfXJivisunQyyK/ZJMgdSYXOy7Gnzfk/ERlT9lpUMqTsPUpBNxk1VTbogahu1IK0eifh1j2bmftOvzZAZ0WSFy9JAFu/UURK7VbRGUMrmvHFKwmsreQ5rtWtaDr1ttj936FEBGRPSgfDLIBEzD/Oygs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cY1jq/ef; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cY1jq/ef"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66d258d1effso56751d50.2
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Sep 2026 11:56:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788461763; cv=none;
        d=google.com; s=arc-20260327;
        b=r6ObaK7YAagRA0241HJldC6uZ10VKuuf+qf3jNQaMAdj9ECIpkBKRw6VdyeL63vOjL
         kRxnkV0f4fkK9503lmFhgh6TOA0LKWlwM6OnRK03i8Grr3veyLPJTA1TIf09eCgwWZu5
         L3s+rgW7RZGDeo5CsNtVYwBaH5mGBMXs90fpTemKrL2XmWIx9U7Ez0c2Tm8srX0InBKR
         DdL1e+gJD4suE1m3tl9xPCJbiAWo04TIJ2h7vgJnJODWiGPMsZb0oMzkYSTI+SFrNOtt
         k+kKTHrsxFDjMAP5G1H3AJQT04yG2+uUXYH+IUxu94RJ1YqN65Nirp1VlJFquKeWWctg
         P9uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=RgphSpYkGxURBDHuqfyYLjrbE8qqQKMa24X8noMB9V4=;
        fh=Ymz9jUKXi0n1aYvW9OF+vldDn9oAbDWxcnzVBEEKCeU=;
        b=oq9lH/Hp5i1FZIMeI6m4LIUraXTtiMKXoS6AgjG2uYVEbr1MYkzfSK1HTR6TY5tPtB
         n2TqDtsM5uJQWdZ7Gu2NaXQBowOaZa4yiIFDlz3cosCGNOLt4oEaXhr7/eB4F40fTZiq
         L5JZViKYOcVmw5P4UEPdbU1KwH2UAWu46b3HwCGfAynp/E6bi6jifeq1CviGkXYMHOZ6
         bd3YszkZHccFq//h53hKNC9+7EMkKLQUI+h2ocbK4NeIJ+N/kv+989rpHtgaGQrexn+e
         hruVXcyYBDJCKOEdrECzJSVal+EPZjuiTK1ZAb1fhSISOPQ21u9rTNBU2yO8PoT2Q4VZ
         ZHkw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788461763; x=1789066563; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RgphSpYkGxURBDHuqfyYLjrbE8qqQKMa24X8noMB9V4=;
        b=cY1jq/efVK6TiLNWssGhz11MXrjfxJjeRE5r3WWo99Q4uBOHIV5T49ymdqpRzseJqE
         Y728ph1P8rORg5cwBaWNgrLnuoNN0XoIzUZzl+BMxoqk9hvLANLbIoTHIA/o/Y4nnh7I
         bu3+3KxFfL3xQjv7cqGh9Bsqv2BOpm9Lva2OXGl8BrKg+fZ8q0aLk8jDgPnviNJh2Iwy
         mCANZIR+dKnKX7noYRKJ1dsL22ZOliMb9zElOCqN6KiBb0WrqZCYnKQ1FFG2N7ihIpaM
         lPJDTj0uQvPqUD3Vx1KQPr8qujlxLX2bbgkhuRuDvThlUCu3BBTBc+6HhBXNNU0N2/dy
         cPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461763; x=1789066563;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RgphSpYkGxURBDHuqfyYLjrbE8qqQKMa24X8noMB9V4=;
        b=gS9gfNbtDJU2UDEIi5fjSELgESgk2f5N/Lk89ppdOoGfs7r0MDVq1zORv4QONw0Iqt
         HS3ii2tLRUHS/x6E11wWBooT6VqcKssVDyO+RBJ2XJdoWQRWrJqHHZf2DIDk89nAoeoS
         cHRuvEFFKfQ6WCOaU1nZB0mAkqN/ExvWBbv81T6AbVInklwr5Yle0xA88WzSFYSylzg0
         jm8RXfCR1GIlucO8WbcsbZY9wjVMZo5ANqY1WE4f+IQOfnBm6vAY5mCX8ynAHhGM0ZGL
         GNO1pFSHTf0o5ZzssVxKI82AS1+IQ5IvVhNfrcXhE/sGTcERvFg6GJzebtFInCbD7DbX
         qlpA==
X-Gm-Message-State: AFuF++ls8AG4qlDFrQS91/bdFAYFcfmwWf1LUrBqAJ+7a9WIZbk/FdYi
	Q5CesIixsIsf/Jq4EfsO3TxcXcilwG7bj6wjD0qczU0w+CmBgA0ycrsrlmQ1W9hB9qMnPvRQEI8
	nV/YVig357WfK471FWGyhJHJ7XVnT+AQ=
X-Gm-Gg: AYBFou2ZtGFjEvkiuZTGqQiLe5PyqiR5bKCRUf1AIexAQxvJyDwfTQlhk+hpL0FwMjV
	fJ2HauZ615PExuSGCfEaZDV0bA5CimmtEwDViDjDKDGaNL4qXbvC+iEKbaqjCwWMnUsUhVOjDM/
	EnD7EU7fFTLfLdzF8QZe7xPMuImlscvlxN50W5Z67DCv43D2WGzPvjJxudOJrP0r/Gd0KXGn6Ih
	c3ZcKIUXapMyzjqXZs2K3IS9668X+fqtaejHP+HspoJ5/+/o9321YuFlJzfw4dI8Rsx1r89dVq+
	k38GzYgLzs87zMmzuLK+kAFrgu0QnLIk2HCfHFtIOcpaig==
X-Received: by 2002:a05:690e:118e:b0:66f:8a11:5dc0 with SMTP id
 956f58d0204a3-66fb5a0f7b9mr261926d50.29.1788461762813; Thu, 03 Sep 2026
 11:56:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: te36de <te36de@gmail.com>
Date: Thu, 3 Sep 2026 11:55:50 -0700
X-Gm-Features: AcwNN1XWb-DGN3vM5fntojDMjxVQWROYAm6W2gQckxCweT_zU5JBMdj-2AdsdhU
Message-ID: <CAOmNcAB8nBueNabeR_tBOjtximEwG9gdn4vt0Os4qac9OukTOQ@mail.gmail.com>
Subject: H618 sunxi/musb driver (likely) looses interrupts -> g_mass_storage
 I/O errors/resets
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org, 
	Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Summary:
  Likely problem in H618 sunxi/musb driver code leading to I/O errors,
resets on g_mass_storage.
  Produced on Orange Pi Zero 3 (OPZ3, H618 based), Linux
6.18.48-current-sunxi64:
    reproduced also with 7.1.12-edge-sunxi64 (problem not fixed in 7).
  set up g_mass_storage on sparse file (no actual I/O required reading
from it), read from host:
    Works reliable for minutes (14...22MByte/sec) when OPZ3 is otherwise idle.
    Creates repeatedly intermitting I/O errors and resets on USB host as soon
    as there is even just some process-level only CPU load on H618
(stress-ng on 2 kernel).
  Problem does not occur on RPI4 using dwc2 (instead of sunxi/musb)
with same tests
  Diagnosis seems to point to lost interrupts.

1. Reproduce by:

1.1 Connect gadget device (Orange PI zero 3 1GB in my case) USB-C port to host.

Note: Given how this powers the gadget device, it may not be
sufficient for gadget devices needing
a lot more current, but OPZ3 stays well below 500 mA under all conditions.

1.2 On gadget device (Orange PI zero 3 1GB):

truncate -s 12T /tmp/empty.img
modprobe g_mass_storage
file=/disk/S2/Shelf.UHD/TMP/avatar/AVATAR_BONUS1.iso stall=0 ro=1
removable=1

1.3. On host device

Determine device name for gadget, in this case /dev/sdb:

[129005.654791] usb 1-1: new high-speed USB device number 9 using xhci_hcd
[129005.785710] usb 1-1: New USB device found, idVendor=0525,
idProduct=a4a5, bcdDevice= 6.18
[129005.785730] usb 1-1: New USB device strings: Mfr=3, Product=4,
SerialNumber=0
[129005.785736] usb 1-1: Product: Mass Storage Gadget
[129005.785740] usb 1-1: Manufacturer: Armbian Linux
6.18.48-current-sunxi64 with musb-hdrc
[129005.787697] usb-storage 1-1:1.0: USB Mass Storage device detected
[129005.788090] usb-storage 1-1:1.0: Quirks match for vid 0525 pid a4a5: 10000
[129005.788244] scsi host2: usb-storage 1-1:1.0
[129006.798208] scsi 2:0:0:0: Direct-Access     Linux    File-Stor
Gadget 0618 PQ: 0 ANSI: 2
[129006.798370] sd 2:0:0:0: Attached scsi generic sg1 type 0
[129006.798560] sd 2:0:0:0: Power-on or device reset occurred
[129006.799139] sd 2:0:0:0: [sdb] Very big device. Trying to use READ
CAPACITY(16).
[129006.799905] sd 2:0:0:0: [sdb] 25769803776 512-byte logical blocks:
(13.2 TB/12.0 TiB)
[129006.800049] sd 2:0:0:0: [sdb] Write Protect is on
[129006.800053] sd 2:0:0:0: [sdb] Mode Sense: 0f 00 80 00
[129006.800181] sd 2:0:0:0: [sdb] Write cache: disabled, read cache:
enabled, doesn't support DPO or FUA
[129006.801447] sd 2:0:0:0: [sdb] Very big device. Trying to use READ
CAPACITY(16).
[129006.821771] sd 2:0:0:0: [sdb] Attached SCSI removable disk

Then start program to read from the disk:

pv -ptera < /dev/sdb > /dev/zero

And in another window check for I/O errors:

dmesg -w

1.3.1 "empty" run:

With nothing else running on the gadget, this should run reliable
without any I/O errors. Throughput
should be beteween 15...22 MByte/sec depending on block size of host
(due to the stop&go nature of BOT
i think).

1.3.2 error run:

In addition to 3.1, start some CPU activity on the gadget, e.g.:

stress-ng --cpu 4 --timeout 6000s

Now observe that after at most a few minutes, I/O error(s) and resets
will happen to the
gadget device, visible on the host, e.g.:

[131887.406689] I/O error, dev sdb, sector 4682752 op 0x0:(READ) flags
0x84700 phys_seg 2 prio class 0
[131887.406725] sd 2:0:0:0: [sdb] tag#0 device offline or changed
[131887.406731] I/O error, dev sdb, sector 4682992 op 0x0:(READ) flags
0x84700 phys_seg 2 prio class 0
[131887.406810] sd 2:0:0:0: [sdb] tag#0 device offline or changed
[131887.406828] I/O error, dev sdb, sector 4683232 op 0x0:(READ) flags
0x80700 phys_seg 1 prio class 0
[131887.416234] sd 2:0:0:0: [sdb] Very big device. Trying to use READ
CAPACITY(16).
[131974.304607] usb 1-1: reset high-speed USB device number 9 using xhci_hcd
[131974.435735] sd 2:0:0:0: [sdb] tag#0 FAILED Result:
hostbyte=DID_TIME_OUT driverbyte=DRIVER_OK cmd_age=31s
[131974.435754] sd 2:0:0:0: [sdb] tag#0 CDB: Read(16) 88 00 00 00 00
00 00 60 51 e0 00 00 00 20 00 00
[131974.435759] I/O error, dev sdb, sector 6312416 op 0x0:(READ) flags
0x80700 phys_seg 1 prio class 0
[131974.436075] sd 2:0:0:0: Power-on or device reset occurred
[131974.436097] sd 2:0:0:0: [sdb] tag#0 FAILED Result: hostbyte=DID_OK
driverbyte=DRIVER_OK cmd_age=0s
[131974.436105] sd 2:0:0:0: [sdb] tag#0 Sense Key : Unit Attention [current]
[131974.436112] sd 2:0:0:0: [sdb] tag#0 Add. Sense: Power on, reset,
or bus device reset occurred
[131974.436119] sd 2:0:0:0: [sdb] tag#0 CDB: Read(16) 88 00 00 00 00
00 00 60 52 00 00 00 00 f0 00 00
(host using larger block size for reads achieve lowe

On OPZ3, these errors happen already with as few as just 2 CPU cores
(out of 4) loaded.

1.4. Notes

- The test from 3. are just to eliminate as many possible sources of
error as possible.
  In the target application, the additional load comes from network
I/O, but i tried to
  simplify the reproduction of the error down to just process level
CPU being used.

- Problem does not happen on RPI4, which is why i think the problem is
not in g_mass_storage/f_mass_storage,
  but in the sunxi/musb driver - RPI4 useses instead dwc2 driver.

- The problem may be happening less often with loweer g_mass_storage
transfer rates,
  but for the target use-case, a speed of 12MByte/sec or more is
required, otherwise
  cheaper (but slower)  gadget devices than H618 would also become an option.

- Problem does not depend on size of file used, happens equally for
smaller file sizes,
  just using such a large file because of intended use-case.

- Lots of parameters that don't change the result when changed
  - "stall=0/1
  - musb_hdrc.use_dma=0
  - capping the host's transfer size (max_sectors_kb=16)
  - different idVendor/idProduct
  - moving the musb IRQ to another CPU via smp_affinity (IRQ 310 is
not shared with any other device)
  - powering the board from a separate supply rather than the host port

2. Troubleshooting

I had claude.ai vibe code me some tracingon the gadget. I can't claim
i understood it really
down to the details, but here is how claude.ai is summarizing it. Rest
of email below
is writeup from claude

Working - one SCSI READ(10), 16 KiB:

  file-storage   do_read() {
  file-storage     kernel_read()             0.03  ms   data from backing file
  file-storage     usb_ep_queue() {
  file-storage       musb_gadget_queue()     0.004 ms   UDC accepts request
  file-storage     }                         0.008 ms
  file-storage   }
  file-storage   sleep_thread() {                       thread waits
    <irq ctx>      sunxi_musb_interrupt() {
    <irq ctx>        musb_interrupt() {
    <irq ctx>          musb_g_tx()           0.010 ms   one packet sent
    <irq ctx>        }                       0.012 ms
    <irq ctx>      }                         0.014 ms
                   ... ~20 such interrupts, one per packet ...
    <irq ctx>      sunxi_musb_interrupt() {
    <irq ctx>        musb_interrupt() {
    <irq ctx>          musb_g_tx() {                    last packet
    <irq ctx>            bulk_in_complete()             request given back
    <irq ctx>          }                     0.010 ms
    <irq ctx>        }                       0.012 ms
    <irq ctx>      }                         0.015 ms
  file-storage   }                           3.8   ms   thread woken

Failing - identical up to the queue, then nothing:

  file-storage   usb_ep_queue() {
  file-storage     musb_gadget_queue()       0.005 ms   UDC accepts request
  file-storage   }                           0.008 ms
  file-storage   sleep_thread() {                       thread waits

                 ... ~30 s of complete silence ...

                 no sunxi_musb_interrupt, no musb_interrupt,
                 no musb_g_tx, no musb_g_rx, no bulk_in_complete

    [host]       SCSI command times out, I/O errors, port reset
    [gadget]     re-enumerates, resumes normally

  Kernel stack of the file-storage thread during the hang:

    [<0>] sleep_thread+0x10c/0x180 [usb_f_mass_storage]
    [<0>] fsg_main_thread+0x10c/0x16b0 [usb_f_mass_storage]
    [<0>] kthread+0x134/0x1f8
    [<0>] ret_from_fork+0x10/0x20

  task state S (interruptible sleep), i.e. it is not blocked on I/O.

  Event counts at the moment of the hang, and the delta over the 2 s
  after the thread parked:

    usb_ep_queue           650      +0
    musb_gadget_queue      650      +0
    sunxi_musb_interrupt 14605      +0
    musb_interrupt       14605      +0
    musb_g_tx            14519      +0
    musb_g_rx               86      +0
    bulk_in_complete       566      +0
    kernel_read            478      +0

What this appears to show
-------------------------

The request is accepted by musb_gadget_queue() and the transfer never
starts: not a completion lost at the end of a transfer that otherwise
ran, but no packet sent at all.

Notably sunxi_musb_interrupt() - the registered handler for the musb
IRQ - does not run even once during the hang.  So the failure is not the
driver mishandling an interrupt; no interrupt is delivered to the handler
at all.  I cannot tell from this whether the controller never raised its
line or whether the interrupt was lost or masked elsewhere.

Since the failure is triggered by CPU load alone, with a sparse backing
file and no I/O of any kind, this looks like a race between queueing a
request and the endpoint's interrupt or FIFO state, rather than anything
in f_mass_storage or the storage path.
