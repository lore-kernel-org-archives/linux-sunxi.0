Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE3938F923
	for <linux-sunxi@lists.linux.dev>; Sun, 24 May 2026 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779626516; cv=pass; b=uebKgrIU664MBPgarzo/I6vpnSIiIeFiVoCmWgpGf95JGd0XJmfvukWldpIk0gy04wgp13onrSlcmN5c/183NIQfrmCwZIx8VgnUBc8Kv3tnXeUXa6QOyC0nCZH6n0/d10uYswcdrf6zGiK33gAgDYuB5jGbPMF9biL+mw3DNQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779626516; c=relaxed/simple;
	bh=iQixGRhxQ2lYAvO6Xt4gzUgMA1dwIbosfsR1NWo0s5w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GMAzWZSyVOcuIr7+YiJ1VuYySmXnFkBsvwmyMnOCM3U0T+sdaY7/YTrGPGVXOJvHeZ2W9+8RWuNySEbGbPfAgBspkKymeeejBQPt1/D+09Scc7KbByTHx9nDeIxFxIxVZ+8cTKWaiVMutLee5timcMHvK4KaCW6LIovbsuI/2Co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Op4EDzQn; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Op4EDzQn"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38e8292423fso59681011fa.0
        for <linux-sunxi@lists.linux.dev>; Sun, 24 May 2026 05:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779626513; cv=none;
        d=google.com; s=arc-20240605;
        b=hWv0Qnk+IGTXcpq+pAZLCoc9T4LZmz1EonRgFnggsU5GrNpCSGrXu3aVouPEXjGRPF
         ip5XnE5oQ2fo032eMIAvXT2L1Gg0TMsWqf5FcwbnW/HCd7zK86ki34gfy0JqgrPjG4Sc
         i4T8xwT7cvB48VsGTqfTc01RqPSazJ+rpJjmRjjQgiExcp18qKCI6xG0aTQIxJVMNsT7
         EXs0y7OTc7hW5PCNCjWSaid+gg43CbOsifJqXKF7m2m4cckhRgNHRzd5Oo9OvHuBSH30
         Jsp91TC4mptXawkihAl057PXwT61a9+mLK8L0UwH58Y7tnhSrSFpmarm92IPUeQ1i7au
         P97Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=4/98YHBiUvLfMPS6LITOOPMQcJ+H5TqK7sLdZGcIrM4=;
        fh=Y0o1NbbN1JJ02YpahlGntmlg/TNlKmqFRwv9i9rtSqw=;
        b=ktDGIMT+ncuzkTWmt/bMeYr3eqeAGiSXVfDvB+ugpJbQCgzHdZ2in/X+Ag4kexIvQI
         mC95KRBJm1zuAJ8X17bKUAnV0tjyUxi/s2e3lRvQFmUTHjf+PDjBgoai5Ho/snwGlyyt
         KcC3Exko75Qi9Mb6MS+PJSYwVqO4pIT66Olggna2pY9gwWr7BHk5vhAPmlXsh/0evSeO
         2sIErvSu7bBMy21FWNGmeEGSF+OIiGaLD59dmMIrZQkNZBlzDDQ4pIr0qzJEDRhyb2FA
         Tk30TQw0tifnjrHlPS52HJ4hnzFe2If7xTvrNbIhTR6kJhWKNpYLus4aWDUj2V5sdgCY
         gBtA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779626513; x=1780231313; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4/98YHBiUvLfMPS6LITOOPMQcJ+H5TqK7sLdZGcIrM4=;
        b=Op4EDzQnv2vYnbvfZN4IirS66TNUqhWRpth4gc+2b1S7Imkt6DNyc0yW8T3uH4bN02
         Iys3QZPq9b/CraK0x2oM76LFixU7uy/dc+1yuO31OkiC5OnTfFlg7ckQ0Xs3X10tfUa+
         F7iO5mpNv9N9Tdhy2/aoewiosvTtg5Ka0IWA1E20IrAxSoDR+YZafXRUTTcGmmF2h3oV
         HxZ9dJRJTe4/Xj3IE8CClOzT/xobIVZX4wa217M1/2+iLuXEhQ2lMGTEj6KGRnKrLhEp
         +o3Fvuy5KYV7f5CemxBzXAdwnXzXgQMF/cSg8xBAgBdOe/GjwK9nklMCev16ZLClKsAV
         PGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779626513; x=1780231313;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4/98YHBiUvLfMPS6LITOOPMQcJ+H5TqK7sLdZGcIrM4=;
        b=HacJ7I4IE8ovnsGB0jYurWH2kfeHtyMjFeTrucg+rntxfv/HuMf21dLoXTxp5rTluj
         bwNr31MLs0xkBVsjNSNQYAq2H/Rp/Nbg0cs0ppzA/EMSH3eGFn4CfVThy5tNC8N6fb2/
         rjEBvq2Y15O7L0JkItFRbQnm5n1N6wOPjWFBLt+PccODKh+Q9p8MpWhYJjMQ+KMojUQi
         /9sPNgNfOM29v+8Icqjf3fA8GipXmJvfG0Af8Hr41sukCIGZ0bVAGUqvOhZG5YyZma6X
         wVSdd1VdRrwncw50R4Veu8KvJfsNvqcW4rwpQfZA1LVQGaEANlsBizHlrwcUz/xGFVrt
         IpDw==
X-Forwarded-Encrypted: i=1; AFNElJ+kr6RmHWNi3TU/3FLg6nNmTOBkDOgTaQ40UtA9pBVjyXnBUo5v7bm+ixrXR73DCmkW8tuMT7vQNa+JLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwaQYvo7u10ErIpEiith0MZP12jWvayoW1v0wpBxsmpr4MRsMLR
	lgfGbLwPlyG7ae63HhrqJPrBV7IPFODFtigQbIchWuZYhqkpvbhuBG1U2JW3SjqIN2HApIXK1Cn
	3AHYf7zRJ5YD1rlBA9hxfYLG5Vok/Rfk=
X-Gm-Gg: Acq92OGz8gdvS0CyoMzekaIUDnD0x1bV+ue86LjYUiwjUvtfOfWEKjT64EUi/51erK7
	u/zqEfSy4U2xCL62KTbghTU6nVV5BeJTBhcF27UKya96GnvhyioXqxZgwd6vcRv0C5GsQJzL3dd
	dSf6ElfTdenysMs6pnrRPX48UsL4HjyTIgQddZPtHukSvVpHJkZlqrKfq4Yfzj94vnuleY4X61+
	s21aJuvt2fKJvHg58+1H2AoiJgmu+4YCdZUJQH6TwAkRVZk/w5tfnTY3xHJ5NeX2g0ml1sDBr7l
	mE7QOydh4nUhLy1oTM/9niLBos0qSyc/E7qoOioWmfK2WY4i8XHeThugL0HiienmftOjtY25At6
	RWxQWsO8=
X-Received: by 2002:a2e:a405:0:b0:394:7f1:511a with SMTP id
 38308e7fff4ca-395d8d4d60dmr28080731fa.28.1779626512722; Sun, 24 May 2026
 05:41:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 24 May 2026 09:41:41 -0300
X-Gm-Features: AVHnY4KLbYRixLzEMmqDuxQ1pHKPDhIZVJe7LuADkhGnCjemCJcPUjosdec64FA
Message-ID: <CAOMZO5AHK2FF1_wws3wQsJs5ofvjn2JpQmk3of+p1+ExL8h+ew@mail.gmail.com>
Subject: sunxi: Watchdog reboot fails on Allwinner R40 after Linux boot
To: Guenter Roeck <linux@roeck-us.net>, wens@kernel.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	linux-watchdog@vger.kernel.org, Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"

Hi,

I am seeing a reboot failure on an Allwinner R40-based board
(Boardcon EMA40i) running mainline Linux v6.18 or also 7.1.0-rc4-next-20260522.
This board hasn't been upstreamed yet, but I plan to do so soon.

The board reboots correctly from U-Boot 2026.04 using the sunxi watchdog,
but Linux fails to reboot even when programming the watchdog
registers with the exact same values used by U-Boot.

The board hangs with:

[ 10.736509] reboot: Restarting system

The watchdog node is:

    wdt: watchdog@1c20c90 {
            compatible = "allwinner,sun4i-a10-wdt";
            reg = <0x01c20c90 0x10>;
            interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
            clocks = <&osc24M>;
    };

The hardware watchdog appears correctly:

[ 0.178494] sunxi-wdt 1c20c90.watchdog: Watchdog enabled (timeout=16
sec, nowayout=0)

I instrumented U-Boot and confirmed reboot goes through
drivers/watchdog/sunxi_wdt.c().

The final register state before a successful reboot in U-Boot is:

ctrl = 0x00000001
cfg = 0x00000003
mode = 0x00000003

and the board immediately resets.

However, under Linux, even direct MMIO writes do not reboot
the board:

devmem 0x01c20c94 32 0x00000003
devmem 0x01c20c90 32 0x00000001

No reset occurs.

I also tested:

- clk_ignore_unused
- removing the watchdog DT node entirely
- nosmp
- maxcpus=1
- psci=off

No change.

I compared:

- Watchdog registers
- CCU registers
- PRCM/RTC regions
- AXP22x PMIC registers

between U-Boot and Linux, and did not find an obvious difference that
explains the failure.

The board hardware connects the R40 RESET/AP-RESET signal to
the AXP22x PWROK input.

The PMIC power-off register works correctly from Linux:

i2cset -f -y 0 0x34 0x32 0x80

but this powers off the board instead of rebooting it.

Has anyone seen similar reboot failures on R40/sun8i platforms,
or is there any known erratum/workaround related to the watchdog
reset propagation after Linux runtime initialization?

Thanks,

Fabio Estevam
