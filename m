Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795796095;
	b=rW/fxx2lyeCO3zB6OWXfVJ3dzP72JiM5BAauGkC/Ait9uUH/rJfcIWeKdKg+4Ewx8Y3y
	 DRcUGgei1E5Zs0ypRc9jzeD4xXIp/HOQD1YaaLXlodux9iAHySiTJb2PaLkGwb8sIuVTu
	 z7Vsc8U3ebAHpg13oxdSACWpbMYzmnyYvqKFBL9jMObibjpG9DZSUd8AGHTH5PIMDAvil
	 PcgLyVdEqvzrMNWP2hORvs5wtDcqp2jyLtD4HuiUgHheySEcynFtDJxXPPJCo2Alf6cum
	 E0X4PfzL0YelpWbR5DdP9ZnVPj2ZRPhxBRgqemnr2sNxecXMNwFIzJHGEsTtji37VMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796095;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=FEdI9V/yoQOW10FCJ74NuO1V0ayU3vrNQof9cU67IpU=;
	b=MjK4dtoyam/5b81UWOSh1bW6adBe2aJmirhNJTKR0Md/vzTh2uRl00RqguRvrGQ0sRHQ
	 ffV40+UftIwOMB/cABhWAPJN174wounkkCj3xJMVzhGmd/BV76CI3fKKszDiC+jjxT8FU
	 C0ORK/tXefybTwqmvrXfZy73pMnD23Kl4M9J8H/PYmZqgy6D3GnwjMMYBKnyqXQVmVtVM
	 hh8ejl5miM4EJEAGW1mAcYmQjoIlYeGIfARAjVftOa3Tny+w7tSbd/6RwupcwLJPyfwFf
	 3st7p2xJTse2z9HyTheoQpB360O1cHLhGquHMfrlB8tP3Icxqv6tr2dQlp/sn2lTdvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=B8F4Skwn;
	arc=none smtp.remote-ip=79.135.106.119
Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354A4606A31C
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 16:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 354A4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=B8F4Skwn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795796081; x=1796055281;
	bh=FEdI9V/yoQOW10FCJ74NuO1V0ayU3vrNQof9cU67IpU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=B8F4SkwngNpJBbClQHWmc+rF3O97uOB++PzO6parsGiba6RaLURy87PfdkvMFX+b8
	 aSLZTIT7jrK/nPSUSxMTkP7IFP7e++J2HGRgDgrO3X6n8K/39fMdHoSVOoG/OUkanA
	 hFWaOFpA0h4g/qP9rSaq7B3A76qO8DFXx6/6jZuFX87hEsAJc/mie2rsHmMj3GYYah
	 saH/50e0H97kAtzjqEp+b1+Ak0u6AvnvQQh0VVFbDxs2Xqg2mfN1lUWEQwQmXfTfnD
	 qwobchlyJNUILAzebZw4zYJyvAFHvXiRTH8iGW5oQ6xUUgLqXaT7/aM98FGxiryw+F
	 CTR3Piee2teHQ==
Date: Fri, 27 Nov 2026 16:14:30 +0000
To: Enzo Adriano <enzo.adriano.code@gmail.com>
From: Norman Herms <dockseed@proton.me>
Cc: andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>, Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid <lukas.schmid@netcube.li>, Cristian Filipescu <filipescu.cristian@gmail.com>
Subject: Re: [PATCH v6 3/5] arm64: dts: allwinner: add Radxa Cubie A7S board
Message-ID: <z51JFKDjnRGxR5v8f-2sigY7Ih39S9_hQJF-C7-0jwRzGvAZcyniqmAsBFOyj_Vci0JDoXGMbuWcop6uSGRMUon5bqjJFMIjMk9jN8TbaLU=@proton.me>
In-Reply-To: <20261126-a733-cubie-a7s-dt-v6-3@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-3@gmail.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: 30faa459dffd9b54a9225b7bf2b8ef2cec020c68
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Enzo,

Tested v6 patches 1-3 on a Radxa Cubie A7S. Same kernel as for v5
(sunxi/for-next 2ba07dfcd45b plus the dependencies; pinctrl at v3,
whose code is the same as v4), same own firmware and the same 2 MiB
bad-DRAM reservation. dtbs_check with W=3D1 and W=3D2 is clean.

Results are the same as with v5:

- PMIC: all bounded rails are within their bounds, and the registers
  read the same as before (DCDC7 1080 mV, DCDC9 1240 mV, ELDO1
  1075 mV). The new vcc5v0-sys -> ps-output -> ldo2v5-input chain
  probes, and eldo-input now reports its fixed 1.24 V.
- PMU: counting and overflow interrupts work on all 8 CPUs.
- MMC0: High Speed, 50 MHz, 3.3 V. Repeated reads and a 64 MiB
  write/readback matched, no mmc errors.
- EEPROM reads the same contents as before. Warm reboot and power-off
  (0 W at the plug) work. No warnings in dmesg.

On the bot's IO bias concern: with the pinctrl dependency applied,
GPIO_POW_MOD_SEL reads 0x05555555 (all auto) and SGPIO_POW_MOD_SEL
0x00055555, PF stays on 3.3 V, and GPIO_POW_VAL reads the same as
U-Boot leaves it (PC/PE/PK 1.8 V, the other banks 3.3 V).

There is still no watchdog node, so I stopped our U-Boot's 16 s
watchdog at 0x7021000 by hand again.

The cover lists CPU/cache topology as untested: all eight CPUs are in
one cluster, as described. Patch 2/5 mentions the shared L3, but the
DTSI has no cache nodes, so the kernel falls back to reporting L2 as
shared by all eight CPUs as well (index2 shared_cpu_list 0-7).

The EEPROM probes as writable. It holds Radxa's factory data, and
our own DT reads the MAC address from it at 0x9e, so read-only might be
worth considering.

Card hotplug, listed as untested in the cover, works with Vinicius'
"do not switch the mux to read IRQ lines" fix (a256b8c8083e) on top:
pulling the card gives "card removed" and reinserting it gives "new
high speed SDXC card". Without that fix the PF6 level follows the card,
but the card detect interrupt never fires, so the A7S needs it for
hotplug.

Not tested: the power key, as the AXP318W driver has no power key
support yet. Otherwise the same gaps as for v5.

Tested-by: Norman Herms <dockseed@proton.me> # Radxa Cubie A7S (A733)

Built and measured by AI agents (Claude) on my board.

Thanks,
Norman
