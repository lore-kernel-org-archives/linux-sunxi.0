Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223471;
	b=iZeKVjq3NCVf4RUiqVE/EBxTlXy42o0hrTYd7kyGrhJaBanKl84sZxolrR8EHHmnP+hf
	 aOdotRzvQDyQAkVKJN8IWDRnLaobCC7GzQaoS6HpzC1uofWDsqqumghWdxOcI8By5Kg5y
	 bNnopoU303ikUECaqPhQkTCyEr1WzBd+GFz+jiR7VUwvBAqUhVNIcNCoKUg9a0+bm4ss1
	 UU4iE/DWaezdAcOEWncNyu72uDajZZdKZRsQuJcXhTgAz5qr25OfP/vl056q+SZglCEFL
	 IGbJdPz8LbIsL4Q1mpAf6bbvOX4XmnjlQMkxWf0qMczeEq79boQ/5xaBETnH+X+nGrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=jqxmKgrhUeW50i3GM0eoV7mLfY/7tQBSWB5JoHqAFCE=;
	b=ypA6wBob1D4XcAJkpb7vm67OQYj2Ffewl6xPrCEGaY4UymW+drHHTp2Jqgxs6+CJrq2/
	 1vPI8Zgk7mIdZO+R+ki5h7gNiNYYD2+5JsGE2cECwzY23LLFFrboaO8JKDPQpvxJP+RaW
	 /DJvoBQi8ZxtCO1AzHTxAMVDCnluQgAlkcH6XXIw59rBcS3w5nsvTOwIU93TYmftzQXx7
	 WUbRIKLjYO0uW6uJMTp86rsf4hwtkfpOFVxHCKI/glmUapkUaKAnVd0HcEE9Ow3uqYZib
	 W80kt8wBbHbd9tddsJCr0cN/xivn2Tfg2xNNKc8LR8aU+P5T1+5UYu0xxKyUa/ihPVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UkfjGf54;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B243606A682
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 01:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B243606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UkfjGf54
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4a76f63b243so2101432fac.0
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 17:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223455; x=1795828255; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jqxmKgrhUeW50i3GM0eoV7mLfY/7tQBSWB5JoHqAFCE=;
        b=UkfjGf54TjzTFMK+WCCMS/bGx0kEsKsB4ikYZwOmdlKONn1PcYV7dcbw4uufzmXzrI
         2P/DKUEvc5a0l4fzOwprpHkRviiZEChgzy/VqkmwAnOp8U0cI3vUuyDyMSRVwfavuQnr
         2Jc+sCl2h2zSfollUX/UO8F//SB/l03f6/qFZK/cHzMFSg47+dQXOfvpc+KzzSrA9SJX
         tk4GOcxoNMkDzPvM907UkqI8uW9DHBAVur3uzZ/+Iap5BOalC60sy1/8xRNQKlg38R63
         PZERCvm26sIDzz5PY8chYwhkLFwZDfm1tltXzJNHLj/0iS+4vui7sx68qJL7LiiurVlc
         vOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223455; x=1795828255;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jqxmKgrhUeW50i3GM0eoV7mLfY/7tQBSWB5JoHqAFCE=;
        b=GPYBBJIpnERcbPXfyfIene2RURwEvP4rVvWEJ+89Z+fzTV+GcNBED67NbBZpkz4kAI
         t3vzwRPMeIZgrSu15S/XdKEImGbadxGR97dbAjrrv71PbrWoXh/AJMKur+86u9CH2H/0
         QD7FBWpx7HrCse9q5bN1ym5mKTQsSwa8yL40utCv0QiAwkg4Lc8UrE8sfmeeusKLrYh/
         RoVfFmUmVYiUURQvzv9Gl08SHDxVUsRLHCDXF75IG+ejqbLKkUIru9WS8wiGUCzqga7L
         M/TUJDetCTxBFgC9miziUU5YjXqdM9tRxOrWEN4kRSIVej9kTemA4ijQsF+rEs7RK+K4
         6lTQ==
X-Forwarded-Encrypted: i=1; AL+hErHeLVXVO4OADX2kDF44U4HfMUqftux3iLrxMGlqLo2IrpJP6P/qPMimwXDXETgbi5tlaL9p6TbOhAaOgQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9LkrCjMCDwA0kIHfMaXNZWKM4l9oXXOf9xfes/soLz72mOI/MF
	GnNpthzp7fU0PmIMo2IwcsIDa3qLa93h0uwyc6/RKtZEjH/y0OPw805N
X-Gm-Gg: AYBFou008qtNEmHcRsySowhVjd70/CWsSzn8+hZL+wxlrdK5oA0Vg0vtUg46UWWuRrc
	jnfzaIzvft1VL44+wPS2CbYk/fr9Lxfd04dgEdlptHDLaKtb2bLBSAvbpJKfqKmJxOt1jsmv6u9
	zDWoTx3JEiFFiPdumZY88RG6HX1dytmm2brDRFWe7LKgI/Rn3OJOXt9FoyG1yNJOTaLdPxpF+on
	vAaigN23w17aMw2OHHWDuSEiK73Tv+C27SgR6Nx/ZYEVk7nUI553PbRHT7wyvaiczG9FnN+zbsC
	2pjETCcJdHEL5tJXEPvqMqIsSIzOF/gRse8QBlpU0xMgJNyP0ZOHy1UHP3hG4UfL0zKYPvPujVb
	xeN+F6RPTg892CaZTuStNZsvP2AdEdRemvycWLT48+zwVkuH08fj3X4K01+ajJIJwjwAGLJQJKY
	xZ0NEJhGz4ZO71bAXpbLsxzPErqAJnu2KgHxhaiogsd+8f0A2M4GGoOaGLhodOy1yvCDuW8cDQQ
	8yTohbub3I72XYlWW4TLWiuHqdkO7PdRWFyesZa9N0uvYv5vb68BItSn+vUF7XrTpoxRRcMwGU9
	ryeTd1g9PsVeE5w/x7f0V7o6bqipOYulXvzcNzt28X6dRU14krRO5KbDAHEubLk0oo/y8EmQUal
	nVxvI7B4rq4TI4VLIN6EHETPNnLb7vXIXHI+MH3GNtJ3JjmtHwPsjQjVxcvh0evaqiZJ5F5DDq+
	xEezkdnlDEWLUd3DdPCHGxXmO+17No/koQ3IVb+Kns8+kMcIMS4Yut
X-Received: by 2002:a05:6808:2229:b0:564:3e9e:b4b1 with SMTP id 5614622812f47-5797c0b7852mr5049445b6e.18.1795223454747;
        Fri, 20 Nov 2026 17:10:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:10:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v11 00/26] mtd: rawnand: sunxi: fix page transfers and
 controller error recovery
Date: Fri, 20 Nov 2026 18:10:23 -0700
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XTzU7kMAwA4FcZ9bxBduLmhxPvgTg4iQtZMS20n
 QqEeHdSRlq6M5ciVaqcRJ8dt/5oJhmLTM3t4aMZZSlTGfoaIP45NOmJ+0dRJdeFRoO24BHUdIr
 HMtdX/1ZUz31Wi/R5GNUwRPXM78NpVgsqMYiUEVIKqanYyyhdefvOdP9wjqv0V9K86uuJpzLNw
 /j+XcqC67lfJ60PKLLGt4aROIe7xyOX55s0HJs16aJ/2AC0m9WVjajBUUec2F2yZsuG3ayprDc
 +RYiMLV2xtGFR72ZpbQJbipIDaX3VhHbLmt1sW1mXHSI4y7a7qtZu2f29tZXVXQRPnYBr8ZJ1/
 1iEX7Cusm02XbKcdeYr1m/Zdjfr108WmbzHLor4SzZsWbebDesPZjUlCGJE2ksW4cdF2F9uHR1
 QOTF2VrIO/F+9n+cxHOX1VOd+Ps9mE3kSVferf3uQhOKJYiBvDej13hwTGOGAPkcLDoKzVir2+
 QVL70dfTAQAAA==
X-Change-ID: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.17-dev

PIO reuses ECC slot zero for every step, but the protected OOB length
belongs to the logical step. In DMA mode the controller can run out of
user-data registers partway through a page. In both cases the driver
can return or program OOB bytes for the wrong step.

A10 and A23 reserve a fixed number of protected OOB bytes per step.
H616 can vary that number. The first patch selects the two layouts
through controller match data so ECC strength selection and protected
byte placement use the same rules. The next two patches compute OOB
offsets from chip geometry and share ECC read handling between PIO
and DMA.

The transfer fixes handle each logical ECC step at its own OOB offset,
stop after failed NAND commands, and prevent a delayed IRQ handler from
completing the next request. Chip identification is kept separate
from public MTD I/O on the same controller. DMA subpage reads report
ECC results only for the steps the caller requested. Preserve the
bad-block marker on erased or pattern-filled OOB reads, and reject
controller ECC layouts that cannot store the marker at its NAND-defined
position.

Normal reads and writes worked on H616. After an active internal DMA
abort, a controller soft reset alone could leave the next read
displaced. Require the AHB reset and use it for recovery. The in-tree
H616 device tree supplies it; an older DT without the named reset will
no longer probe.

The final two patches reduce register accesses on the normal I/O path.
They reuse ECC results within one transfer and write the packed OOB
lengths once per register instead of updating each field separately.

Models and validation notes: https://github.com/jameshilliard/linux-h616-nand-tla

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Changes in v11:
- Preserve the plain bad-block marker on erased OOB reads and reject
  controller ECC when its layout cannot store the marker.
- Keep a failed DMA recovery's error on reads as well as writes.
- Keep ECC results from preceding steps out of DMA subpage reads.
- Rebase on nand/next and omit the three patches already applied.
- Select fixed and programmable protected OOB layouts through match
  data. Share ECC read handling directly between PIO and DMA, including
  on NAND that needs scrambling but stores a plain bad-block marker.
- Distinguish ECC errors, hardware patterns and corrected data in the
  ordinary read path before updating the ECC register accesses.
- Compute protected OOB offsets from chip geometry before the transfer
  fixes. Keep the register-access optimizations at the end.
- Select small-page read commands before propagating errors from column
  changes and erased-chunk checks.
- Fold the absolute OOB column comparison into the transfer-error fix
  so small-page writes keep working at that point in the series.
- Distinguish normal H616 I/O from the soft-reset failure after an
  active DMA abort, following Krzysztof's review.
- Link to v10: https://patch.msgid.link/20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com

Changes in v10:
- Require resets and reset-names for H616 in a binding patch before the
  DMA-abort recovery change.
- Reset the H616 data path after DMA aborts. Require and exercise its
  exclusive AHB reset at probe and reset before releasing the DMA mapping.
  Propagate unexpected reset errors and reject further commands after
  failed recovery.
- Group shared-path preparation before the existing-driver fixes, followed
  by register-access optimizations and the opt-in format support.
- Share buffer command sizing between reads and writes, and use those
  boundaries when decoding a randomized tail spanning multiple commands.
  Keep the decoder correction in the format patch.
- Skip unavailable NAND child nodes before claiming chip selects.
- Scan all chips before publishing MTD devices, with separate registration
  bookkeeping for partial scan and registration failures.
- Limit direct buffer transfers to 1024 bytes per command, independently
  of the advertised SRAM size, and share the limit with the parser.
- Send every address cycle in parser-split instructions, using the subop
  count independently of its start offset.
- Propagate chip clock setup failures before installing timing registers
  or issuing commands, and update the cached rate only on success.
- Carry Sebastian Andrzej Siewior's Reviewed-by for the IRQ lifetime fix.
- Link to v9: https://patch.msgid.link/20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com

Changes in v9:
- Add an independent fix rejecting pages that exceed the controller's ECC
  step limit, as reported by Sashiko. Keep it after the initial refactor and
  retain the final ECC step size when validating explicit or maximized ECC.
- Add missing Reported-by and report links for the IRQ lifetime,
  small-page read and DMA user-data batching fixes.
- Make the existing PIO and DMA OOB-read branches explicit in the initial
  refactor, preserving their transfer ordering and error handling.
- Add a cached pattern-ID accessor with status caching, so the Allwinner
  format can request pattern IDs without duplicating the shared reader's
  register-read conditions.
- Clarify OOB callback indices, buffer and ECC-cache lifetimes, and why
  an empty pending-event mask completes the IRQ timeout recheck.
- Explain packed parity placement and byte-based erased-page classification
  as Allwinner format compatibility rules, distinct from hardware limits.
- Link to v8: https://patch.msgid.link/20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com

Changes in v8:
- Add a separate fix for the pre-existing zero-pattern overwrite reported
  by Sashiko. Preserve synthesized data and OOB in the existing-format
  read path without treating zero chunks as erased.
- Place the fix after pattern-ID selection and update the later status
  caching conversion to use the same pattern check. Keep the initial
  refactor behavior-preserving and the Allwinner format callbacks unchanged.
- Recheck the remaining command/DMA events after draining a timed-out
  handler, as suggested by Sebastian Andrzej Siewior. Accept completion
  during cleanup and balance IRQ disabling even when the recheck succeeds.
- Link to v7: https://patch.msgid.link/20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com

Changes in v7:
- Put a behavior-preserving OOB refactor first, the correctness fixes next,
  register-access optimizations after them, and the binding and Allwinner
  format last. Keep 16 patches with no external prerequisites.
- Keep logical-step length, read recovery, IRQ lifetime, write failures,
  pattern IDs and DMA limits independently reviewable. Correct pattern-ID
  selection before introducing per-transfer status caching.
- Update both DMA callers with the protected-OOB helper contract in the
  logical-step length fix, before the later batching change.
- Isolate format policy behind its own callbacks and one opt-in attach
  path. Fold packed H6/H616 geometry and contiguous parity reads into the
  final patch, leaving existing format callbacks unchanged.
- Use scrambled_plain_bbm_oob for the existing scrambled profile and
  allwinner_oob for the firmware profile. Keep shared randomizer helpers
  generic and name the H6-generation spare predicate after H6.
- Clarify protected-OOB terminology, logical/hardware indices, transfer
  failures and the limited small-page read scope. Explain the RT timeout
  mechanism and disable_irq() tradeoff discussed with Miquel Raynal.
- Explain installed-format compatibility and that the spare check re-encodes
  ECC-decoded protected OOB rather than rereading physical bytes.
- Drop the standalone OOB-helper renaming cleanup and explicit stable Cc
  trailers; retain Fixes tags and Conor Dooley's binding Acked-by.
- Rebase onto current MTD nand/next.
- Link to v6: https://patch.msgid.link/20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com

Changes in v6:
- retain the bank-sized first DMA batch, but transfer later logical steps
  individually to avoid PAGE_OP's absolute internally generated main columns
- keep ECC exception mode enabled for randomized reads on all supported
  controllers, using the shared physical-pattern classifier
- classify uniform-pattern steps even when hardware suppresses their ECC
  errors; skip their correction counters and preserve decoded buffers unless
  the page-wide zero override or vendor spare predicate accepts the page
- Link to v5: https://patch.msgid.link/20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com

Changes in v5:
- add a separate small-page command-handling fix: use READ0/READ1/READOOB
  with the page address for rereads and normal OOB access, and select PIO
  instead of the large-page DMA sequencer
- keep physical reread errors visible, preserve the OOB cursor and retain
  the existing ECC geometry requirements, including rejection of 512+16
  with controller ECC
- group the small-page fix and the DMA register-bank fix with the opening
  fixes, ahead of cleanups, bindings, format support and optimizations
- make the DMA register-bank fix independent of randomized-OOB support
  and the later register-access optimizations
- Link to v4: https://patch.msgid.link/20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com

Changes in v4:
- prepend an independent fix for completion reuse and IRQ timeout races:
  initialize the completion once, finish IRQ register updates before
  signalling success, and drain timed-out handlers before clearing their
  interrupt state
- add a separate fix for aggregate protected-user-data register overflow
  by splitting DMA transfers into bounded batches, retaining the existing
  OOB layout, ECC offsets and DMA support
- distinguish logical page steps from batch-local hardware slots, retain
  page-wide ECC accounting and avoid retrying partially transferred writes
- Link to v3: https://patch.msgid.link/20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com

Changes in v3:
- add a prerequisite fix for the logical OOB length used by PIO transfers
- clarify logical ECC steps versus hardware slots and share protected-OOB
  register indexing
- select the controller-specific vendor spare-byte erased-page check from
  the SoC capabilities, only in randomized-OOB mode and without rereading
  the main data
- retain hardware-decoded data and protected OOB on other ECC failures
  for bad-block and BBT pattern scans (reported by Miquel Raynal)
- retain a bad marker and ECC failure for all-zero physical pages, and
  disable the ECC exception for the vendor format
- share page classification between PIO and DMA, reading complete pages
  for randomized-format subpage requests
- propagate OOB read errors and defer randomized-format ECC accounting
  until those reads have succeeded
- propagate read/program setup, column-change and buffer-transfer errors,
  including extra OOB; stop failed writes and disable ECC and randomization
- discard partial DMA ECC statistics before retrying in PIO, and keep
  correction counts separate from successful OOB-transfer status
- select the current hardware step's pattern ID instead of slot zero
- avoid a second program confirm after an OOB-only write
- avoid redundant column changes before writing extra OOB bytes
- reject oversized ECC steps in randomized-OOB mode before the core can
  fall back to software ECC
- combine adjacent parity and trailing OOB reads in randomized-OOB mode
- remove duplicate chip setup immediately before core page commands
- program each packed DMA user-data length register once per operation,
  and write PIO slot zero directly without read-modify-write
- reuse pattern IDs and packed error counters within a DMA read, while
  refreshing the snapshot after every PIO ECC operation
- Link to v2: https://patch.msgid.link/20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com

Changes in v2:
- rebase on the current MTD nand/next branch
- retain the merged protected-OOB allocation, BBM reservation and
  stack-buffer fixes
- clarify that randomization is part of the normal hardware-ECC page
  format while MTD_OPS_RAW continues to expose physical bytes
- explain why a BSP-compatible BBM remains randomized in physical raw data
- document the decoded bad-block and flash-BBT access paths
- reject the firmware OOB format with software or disabled ECC
- document the BSP page-format compatibility contract and the
  older-controller format audit
- Link to v1: https://patch.msgid.link/20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com

---
James Hilliard (26):
      mtd: rawnand: sunxi: select the protected OOB layout from match data
      mtd: rawnand: sunxi: compute protected OOB offsets from page geometry
      mtd: rawnand: sunxi: share ECC read handling between PIO and DMA
      mtd: rawnand: sunxi: use the logical step's OOB length in PIO
      mtd: rawnand: sunxi: reject ECC layouts that overwrite the bad-block marker
      mtd: rawnand: sunxi: use page reads to reposition small-page NAND
      mtd: rawnand: sunxi: propagate page-setup and erased-check errors
      mtd: rawnand: sunxi: drain interrupts before reusing the completion
      mtd: rawnand: sunxi: stop failed program operations and disable ECC
      mtd: rawnand: sunxi: select the pattern ID for the current ECC step
      mtd: rawnand: sunxi: preserve synthesized zero-pattern data and OOB
      mtd: rawnand: sunxi: handle ECC results in the batch reader
      mtd: rawnand: sunxi: propagate buffer and column transfer errors
      mtd: rawnand: sunxi: avoid a second program confirm for OOB writes
      mtd: rawnand: sunxi: bound DMA batches by the user-data register bank
      mtd: rawnand: sunxi: limit DMA subpage ECC results to the requested range
      mtd: rawnand: sunxi: preserve bad-block markers on erased OOB reads
      mtd: rawnand: sunxi: send all address cycles in split operations
      mtd: rawnand: sunxi: propagate chip clock setup errors
      mtd: rawnand: sunxi: limit buffer transfers to the command byte count
      mtd: rawnand: sunxi: skip unavailable NAND child nodes
      mtd: rawnand: sunxi: scan all chips before registering MTD devices
      dt-bindings: mtd: sunxi: require the H616 AHB reset
      mtd: rawnand: sunxi: reset the H616 data path after DMA aborts
      mtd: rawnand: sunxi: reuse ECC status within each transfer
      mtd: rawnand: sunxi: reduce user-data length register accesses

 .../bindings/mtd/allwinner,sun4i-a10-nand.yaml     |    3 +
 drivers/mtd/nand/raw/sunxi_nand.c                  | 1465 ++++++++++++--------
 2 files changed, 863 insertions(+), 605 deletions(-)
---
base-commit: ec1e844b9486302a488abc03ea918db60709766e
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
change-id: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

