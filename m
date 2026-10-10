Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A48332907
	for <linux-sunxi@lists.linux.dev>; Sat, 10 Oct 2026 08:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=119.15.109.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791620191; cv=none; b=WZ/456m/Bypn2wdidKTkoRtbTmYFsaIJv1Agbs+3Tc8SPcWMQnafBB43QBQuOKeyQWv/0hbAbVJZs/5T7lHm7BhQvfHjnFx+VD3BESeHGpd3bcM6hNE8+41NbtKIn6FLzknOoIEooVK+b9guysALHoU9cgnh7jBX64SZ8fhoz18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791620191; c=relaxed/simple;
	bh=iS7pFM5D+UkhgC7HaD6V5CtJXEh413NHN4GXZkDZH7U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V+EaPMwP4q8gCD46hnN9OLlI0zmJFODyabX8qaMAkzyrV7UXXNOcisE8i+mi+FN4RMawF9Fi7QsCdhFxvqFRKriOVYk6uILid3KwnQohxNSoTq5/yOlfqfn1STknCQLo9QsZOHlojGfByutHaOvFHzCmM3RZIZIbQMbzZ3vLPPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org; spf=pass smtp.mailfrom=d-silva.org; dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.b=O2v9HO51; arc=none smtp.client-ip=119.15.109.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.b="O2v9HO51"
Received: from hawking.lan (ntp.lan [10.0.1.1])
	by www.nmnhosting.com (Postfix) with ESMTPSA id 44836401D4;
	Sat, 10 Oct 2026 19:16:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1791620172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iS7pFM5D+UkhgC7HaD6V5CtJXEh413NHN4GXZkDZH7U=;
	b=O2v9HO51tgo5wLUEISBYnHzriQb5P/vJL6/0uT4txfGt/6b3quZYItOnoS4zPvg1CJ2Uld
	rxGZ2TP4P+FOojjDwGB2LfXtof1nNOYGgZTyr1Z42oLykndzlPgpW13O798rSdLbfilArH
	X0r18aKmzKMUyBdrZtAAOXXpvkv7DQR8+xnjX3x1/6deIJwVekxG8PNKH3ibDo5MxJeYY7
	scbMy0nIEiHL4N92hxkoBBwfMtz441bDfkJtUKP2+V1baNeLNv88PghjJOY2WzzJwFnLKz
	MG3gdIYajrhdV6NRMP4/Soh1oaXxqNI6cGSJxXu9tlCamAEk/OUpB6PI0hPCaA==
X-GPT-Reason: legitimate; the email is a technical discussion regarding
	U-Boot and SoC support (A733) which perfectly aligns with the
	personal/professional context of the recipient (alastair@d-silva.org);
	the sender identity (alastair@d-silva.org) matches the recipient's
	domain, indicating a direct and personal correspondence; the content
	is a highly specific, multi-part technical thread involving kernel
	porting and memory initialization with no signs of urgency, marketing,
	or phishing; the URL provided (github.com) is a standard repository
	for open-source software development and is consistent with the
	technical subject matter.
Message-ID: <277fbb28e539eb61d492b3d1c79db12d5eba6078.camel@d-silva.org>
Subject: Re: [PATCH v3 0/9] sunxi: Add support for A733 SoC
From: Alastair D'Silva <alastair@d-silva.org>
To: Andre Przywara <andre.przywara@arm.com>, Vinicius Pedrosa
	 <vinicius.eduardo.pedrosa@gmail.com>, Yixun Lan <dlan@gentoo.org>
Cc: u-boot@lists.u-boot-project.org, linux-sunxi@lists.linux.dev, Jagan Teki
	 <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>, Jernej
 Skrabec	 <jernej.skrabec@gmail.com>, Paul Kocialkowski <contact@paulk.fr>,
 Samuel Holland <samuel@sholland.org>
Date: Sat, 10 Oct 2026 19:16:12 +1100
In-Reply-To: <3f57db40-a604-4800-b15f-2d159a3a5ca7@arm.com>
References: <20260113-01-a733-soc-support-v3-0-f19dcd098f60@gentoo.org>
	 <20261009120356.194364-1-vinicius.eduardo.pedrosa@gmail.com>
	 <3f57db40-a604-4800-b15f-2d159a3a5ca7@arm.com>
Autocrypt: addr=alastair@d-silva.org; prefer-encrypt=mutual;
 keydata=mQINBGactvoBEADBFM2HqfQUUM4j40ZQPyYzmnM8S6zrycO0ipDDPMs7nZMzyzGzOdqfS
 VB/tuYvZOOKVWzJuWJ5aT/YyHx54r3L+D5hTkEG0sXPVJky3yTS9sbHEMSLBHb8TVVuhPVPuieV4g
 Nkqg5POMTidk8xAw50WpV++tUlewXVSciehnuCQPXhXMP7FcCh4uO8LdN7E8m7ir1LafKTFfoWPah
 KVT8NGG9r+ucrFcN5F+VnHxTDaI68yRPkNdtUWmp22wIX1KwDCtKFrndYO4p5Hv2hlDKomsuIIHHn
 muQGRwuh0xpf0nVJNF8ETZHMzxQLfo3e/HvxBFOTkwY9w7CuuQFZchbhS0I3PfmGT0+jiNcdfqjDC
 fPPB5uhy+DkR6wO72vuwFYUrpU2mdliDSdKEtWBHulnXMJjpBOXetfIwhI8G2dTVg59lN5i9DvJZc
 7y1Sp+qfZQ4P9qpYZyQEKR4GNDOdnm6F2LW2cZkcyAU/Ii765zdDMTQMIzZNSxT/FcDd0K1voTNRl
 QHbQw+kmIMhzSv2JefcC9oNbE0XYzcBDNP5T3O/4itOQ90GCKQEPAbIPeBjlQif7kkyvo/H6yv4s9
 duuK7zbJD9AID/+KGLkpU3p68VDB/C2ZSb9rQz3p1CJNSfsX/CPk7sPqA7RKZ4a2B0hSJ2pJCncNZ
 KXtMlkkm/FmewARAQABtCdBbGFzdGFpciBEJ1NpbHZhIDxhbGFzdGFpckBkLXNpbHZhLm9yZz6JAl
 EEEwEKADsWIQTQGemDFwqYyU/dBWv75AdnjVo60gUCZpy2+gIbAwULCQgHAgIiAgYVCgkICwIEFgI
 DAQIeBwIXgAAKCRD75AdnjVo60qHZEACJnLfpS71Hk8bX0CLCNJ5wgqdZD3pBHEdbv9Ux9kRlZp4a
 ZFwlg9ltwBjl2dZP3PLtD9xQdsdYKVippKd5a7ZZC2y81oDaHjeC9LnPYn8+ce3mGE/+gRyoNfToY
 N06DeUNJKSlZ9t11UIqZCgfp12u16/Yrigy8C4ihEeHXlLhNX6JkeJR5gsHXJnC7vSuMZY+Qz2R72
 ZidWg+cd2WDMGop5sbTvc+55q94A7vTMlWzaix5HdbEUA3sd2U0dMBju5QodRGGhDQMcCu64TydRD
 MtMzzOk9ThJ036ze3HASWGOppyQmaw58k+XNzbHlr9Sc1LsFUNF7zpWXac2rzlywbyRAdFIT/TC76
 hy9zOkwIo2nwA/tdIwLx1j0UZPpAMQmcDUvJqZh6sE+fv6HN0yMPr+sSYJmriMt8Z6leCEHQXOHVI
 SI5z5FvV3coMmHYRq6aXpfs/8SLiYgkV3B0HE/E18Y3j1OkeLYoqIH1VfzQZeCSL/S77NYvk60/MV
 1HFSyqLdUR3uWZI4uZzoEcMoB0GX33uCTp2Ntc00+wSntwekCUQLCMLUb7dZrbpVuobHoWWtkiD2I
 uE5kAiaVwwwzM0BUwiM6VzVoKbeECz93rdsNtwoDqM0NtzoISC46H/BKVQ9mRNXDO4ThEBpJ4H2Tn
 mPNRYYcR0u2mNy1EJII04w==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2026-10-09 at 16:34 +0200, Andre Przywara wrote:
> Hi Vinicius,
>=20
> On 10/9/26 14:03, Vinicius Pedrosa wrote:
> > Hi Yixun, Andre,
> >=20
> > I'm porting U-Boot to the Radxa Cubie A7Z (A733, 1 GiB LPDDR4) and have
>=20
> I read this wording ("I port xxx to the <board name>") now multiple=20
> times, from different people (blame AI?), but please avoid that.
>=20
> First: The main thing here is the SoC support, the board is just a minor=
=20
> technicality. Once we have the DT bindings(!) settled, and figured the=
=20
> clocks and other basic peripherals, enabling a certain board is not a=20
> big problem, it's mostly just the board .dts bits on top of the SoC.=20
> dtsi. Relatively easy for boards with schematics.
>=20
> Second: you *contribute* to the efforts, building on the work of others.=
=20
> Doing this all on your own would be a big effort, and not be=20
> recommended, and be it just to avoid working in the wrong direction.
>=20
> Third: Honest question, is it really *you*, or is it some LLM? I grew a=
=20
> bit suspicious lately when it comes to lengthy contributions out of the=
=20
> blue from "new" people.
> =C2=A0=C2=A0 > a board series (DTS, defconfig, MAINTAINERS, doc) on top o=
f your A733
> > work. Before posting it I'd like to settle the base and the boot flow.
> >=20
> > With A733/next (165f07a69706), TF-A A733 (f4c0b0dba78a) and sunxi-tools
> > PR #223, the SPL/FIT flow works here: boot0 trains DRAM, drops into FEL
> > on "2" over UART, and the SPL loads BL31 and U-Boot. I had to clamp the
> > SPL's fixed 2 GiB to the board's 1 GiB, and BL31 was linked for DRAM at
> > 0x48000000, which the vendor kernel needed.
> >=20
> > Andre's suggestion from January works too: load BL31 and U-Boot proper
> > directly over FEL, no FIT. I used BL31 at 0x48000000 and U-Boot at
> > 0x4a000000, then reset64 into BL31. The RMR request gets the core to
> > AArch64 EL3 without an SPL, and the same BL31 and U-Boot binaries reach
> > the prompt.
>=20
> Please note that this is all temporary. IIUC, some people already=20
> cracked the DRAM init, within a mainline U-Boot base, which involves=20
> uploading some firmware to the DRAM controller. I haven't seen any code=
=20
> yet, but I guess it sits tightly on some github.
> So we don't need to make those hacks we are using for now pretty, it=20
> just needs to be something usable.
>=20
> What I am using meanwile:
> Have *just* boot0 on an SD card, which automatically drops into FEL, if=
=20
> it can't find the rest of the firmware. From there I just upload U-Boot=
=20
> proper and TF-A, maybe the kernel via FEL.
> I have masssaged Yixun's patches to just cover U-Boot proper, which=20
> looks much cleaner. I will post that at some point, but it's all a bit=
=20
> premature without having the SoC .dtsi, which is still waiting for the=
=20
> clock DT binding headers.
> =C2=A0 > What's missing there is the RAM size. I couldn't find a usable s=
ize
> > from boot0 in SRAM after entering FEL. Without it U-Boot falls back to
> > get_ram_size(), whose probe range covers BL31 and goes past the 1 GiB,
> > so I didn't let it run.
>=20
> Why not? Probing DRAM is somewhat the idea of that routine, and it=20
> should restore the previous values it overwrote? So have you tried=20
> running that?
>=20
> As for the rest: as I mentioned above, there is no reason in finding a=
=20
> proper solution for that problem: we will have proper DRAM init soon=20
> enough, it seems, and then the size will be at the right place in SRAM.
> Meanwhile either hardcode it or place a memory node in the DT already.
>=20

FYI, I've got the TF-A patches in-flight for A733 atm, and have a working
U-Boot for the Orange Pi 4 Pro (A733 LPDDR5 here):
https://github.com/InfernoEmbedded/u-boot/commits/upstream-v1-core-bringup/

There is a gotcha though, I'm not submitting that branch as-is, as the PMU
firmware was reverse engineered, and not in a clean-room fashion, so I'm
not comfortable putting that forwards.

I'm currently working on a clean-room reimplementation (and keeping a
provenance log) which I will submit soon.

Now, I only have hardware on hand for LPDDR5, so I can't really validate
DDR4 PMU firmware, so I was not planning on putting that forwards in the fi=
rst
pass. I would be very grateful to have someone help ensure the PMU firmware
can successfully bring up a DDR4 board.

Cheers,

--=20
Alastair D'Silva
