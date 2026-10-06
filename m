Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0993BB9EB
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Oct 2026 20:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=119.15.109.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791319953; cv=none; b=T/v8im7jJu5Sri63/KL6F2+HFCcMls6dBzI5ur2iv2RX9fm/7mTomPK2yaUpv3ljgNdD4/nSKl/BwUtAQmTSjUecXvrZn1DlPmm2h587nZxKtZZ6EqD5pzgVx7J7gPa1J1YCQEQhBxP6u3d2Tmsf8U+P4RmgQ+vmBVfVkVJcG18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791319953; c=relaxed/simple;
	bh=/SvnYaz/607ptvbRe23q4AT9zWa1Vk9y7RGhbzZ0fUY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nhiYRdb2QT9+NYN7wnQWwnhkoLF1F11S4XOHCQ/3EQn30XTHTa7z51R887PCA/7zjMWFZyCyZtdudfBQ98FhIvIPxH4Cd79ElalDD7Dh3KY51U2znNezULQX1CeryTARVrVWzoFDE0lfnVdLqAsJXWEZkGlxooa8BIhhMJb2yU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org; spf=pass smtp.mailfrom=d-silva.org; dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.b=P55FS4g0; arc=none smtp.client-ip=119.15.109.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.b="P55FS4g0"
Received: from hawking.lan (ntp.lan [10.0.1.1])
	by www.nmnhosting.com (Postfix) with ESMTPSA id D513B405EB;
	Wed,  7 Oct 2026 07:52:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1791319941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/SvnYaz/607ptvbRe23q4AT9zWa1Vk9y7RGhbzZ0fUY=;
	b=P55FS4g0kprbDn5b/Qgc59mtvF6NT0T4n8jlGT2GtQDAtV+l2j3lMpEt4miujNvItIy8YU
	VCnw1f8CJtRXwTAiR0n16ERhDAa5WbBU/8N1JaZgM7G8meSw6wIaX7cBi62sYfi7AvAABQ
	hpNYS96RIE59QoznE4BbQjO88/yTwlzmvKBsTor9C8vQxzwB1/Dv9gQfrnIBxeeaZvzh6A
	PRsnodqBbTAAt5JJQrXIIaj/pMPxKKL9Bqt+ceRqYfWp7tLIWgFcNt0V1hdBybHGGTaqHb
	iHkKcJfIi8jj7ZJ5cDyaJnDYKIy1wft+f/RwpwRhLepkVFcdhSx0xlNnTopPQw==
X-GPT-Reason: legitimate_personal_technical; The email is a highly
	technical, peer-to-peer engineering discussion regarding firmware
	(TF-A) and SoC (Allwinner A733) development; it matches the personal
	mailbox of the sender (alastair@d-silva.org) and contains specific,
	non-generic technical details like commit hashes and hardware
	specifications; the links point to reputable developer platforms
	(github.com) and the content reflects a professional, collaborative
	technical workflow without any signs of phishing or unsolicited
	marketing.
Message-ID: <556cd32394062960a3ea4af0011155cfa83ae91f.camel@d-silva.org>
Subject: Re: [TF-A / sunxi] Allwinner A733 (sun60iw2) TF-A Support &
 Validation on Orange Pi 4 Pro
From: Alastair D'Silva <alastair@d-silva.org>
To: Jernej =?UTF-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>, Andre
 Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev
Date: Wed, 07 Oct 2026 07:52:20 +1100
In-Reply-To: <whzyZ-3mTjSNFzcz-TbNtw@gmail.com>
References: <d30ac7e4f380c2b9d446ae128ef9f4e4aaa2326a.camel@d-silva.org>
	 <whzyZ-3mTjSNFzcz-TbNtw@gmail.com>
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

On Tue, 2026-10-06 at 19:42 +0200, Jernej =C5=A0krabec wrote:
> Hi!
>=20
> Dne torek, 6. oktober 2026 ob 14:16:49 Srednjeevropski poletni =C4=8Das j=
e Alastair D'Silva napisal(a):
> > Hi Andre, Jernej,
> >=20
> > I have been working on upstream support for the Allwinner A733 (sun60iw=
2)
> > SoC using the Xunlong Orange Pi 4 Pro as my test vehicle.
> >=20
> > Building on top of Jernej's in-flight A523/A733 groundwork (specificall=
y
> > commit 5bc9605cb "feat(allwinner): add A733 support"), I have developed
> > and verified a clean 6-commit series that completes BL31 enablement for
> > the A733 without requiring vendor out-of-tree SMC hacks.
> >=20
> > Summary of What Was Implemented:
> > 1. Disable SCPI in Favor of Native PSCI:
> > =C2=A0=C2=A0 Explicitly sets SUNXI_PSCI_USE_SCPI :=3D 0 in sun60i_a733/=
platform.mk to
> > =C2=A0=C2=A0 avoid compiling unused SCPI driver dependencies.
>=20
> Don't do that. A733 (as does A523) has ARISC core, so porting Crust
> firmware is possible.
>=20

Understood completely. The intention was simply that because Crust is
not yet ported to NCAT2, native PSCI is required to boot today. I will
ensure SCPI is not hard-disabled (using SUNXI_PSCI_USE_SCPI ?=3D 0 with
native PSCI default), so that when Crust support is developed for the
ARISC core on A523/A733, it drops in without conflict.

> >=20
<snip>
>=20

> > 6. Per-Core Security Re-arm on PSCI CPU_ON:
> > =C2=A0=C2=A0 Added sunxi_security_setup_core(core) to re-configure only=
 the waking
> > =C2=A0=C2=A0 core's SPC decode port in sunxi_pwr_domain_on_finish(), av=
oiding full
> > =C2=A0=C2=A0 SoC peripheral security re-initialization on hotplug.
>=20
> Is this something that can be done for every SoC?
>=20

Yes, this applies to the whole NCAT2 family (both A523 and A733).
On NCAT2 SoCs, the Security Permission Controller (SPC) introduced
per-core CPU decode registers (SUNXI_SPC_CPU_DECPORT_SET_REG). When an
individual core transitions out of power-down via PSCI CPU_ON, hardware
resets that core's decode port to Secure-only.

Older SoCs (A64/H5/H6) only have peripheral decode ports, so they never
encountered this. Because A523 and A733 share sunxi_native_pm_ncat2.c,
calling sunxi_security_setup_core(core) in sunxi_pwr_domain_on_finish()
directly benefits both A523 and A733, while remaining an invisible
no-op for SoCs that do not define per-core decode registers.

> >=20
> > Validation on Physical Hardware:
> > I verified this series on actual Orange Pi 4 Pro hardware across the
> > entire software stack:
> > - 8-Core SMP Boot: Clean bring-up of 2x Cortex-A76 + 6x Cortex-A55 unde=
r
> > =C2=A0 Linux 7.x with dual-cluster cpufreq.
> > - PSCI Dynamic CPU Hotplug: Verified cycling secondary cores 1=E2=80=93=
7 offline
> > =C2=A0 and back online under load.
> > - PSCI System Reset: Clean reboot via PSCI SYSTEM_RESET.
> > - Hardware Qualification: Passed full automated qualification testing
> > =C2=A0 across all SoC peripherals un-gated by BL31, including PCIe Gen3=
 (NVMe),
> > =C2=A0 Display Engine 3.5 DRM, GMAC, SD card IDMAC, Crypto Engine V5 (H=
WRNG),
> > =C2=A0 NPU, THS, and PMIC.
> >=20
> > Related Repositories & Test Environment:
> > For reproducibility or inspection of how this integrates end-to-end,
> > the corresponding branches are available here:
> > - TF-A (sun60i_a733):
> > =C2=A0 https://github.com/InfernoEmbedded/arm-trusted-firmware/commits/=
sun60i_a733
> > - U-Boot (v2026.07 rebase with 100% open-source SPL & freestanding C PM=
U
> > =C2=A0 firmware, completely replacing vendor boot0 blobs):
> > =C2=A0 https://github.com/InfernoEmbedded/u-boot/commits/feature/sunxi-=
a733-orangepi4pro
> > - Linux Kernel (7.x edge with A733 DT and driver support):
> > =C2=A0 https://github.com/InfernoEmbedded/linux/commits/feature/sunxi-a=
733-orangepi4pro
> >=20
> > Upstream Coordination:
> > The TF-A commits are prepared with Gerrit Change-Id headers.
> >=20
> > Jernej, Andre:
> > How would you prefer to coordinate this for review.trustedfirmware.org?
> > - Should I submit these 6 commits to Gerrit as dependent changes on top
> > =C2=A0 of your A523/A733 branch?
> > - Or would you prefer to squash/fold these fixes directly into the base
> > =C2=A0 A733 submission before pushing?
>=20
> What fixes?
s/fixes/patches/

>=20
> >=20
> > I am happy to follow whichever approach works best for you.
>=20
> I'm fine if you or someone else takes over upstreaming A523 and A733.
> This would need fixing comments which are already on Gerrit.
>=20

I am happy to take ownership of reviving and upstreaming the combined
A523 and A733 series on Gerrit. I will rebase the base A523 patches,
address the open review comments (such as the standalone watchdog #if
syntax and GIC driver feedback), and stack the A733 enablement on top.
One note on testing: I only have physical A733 hardware on hand
(Orange Pi 4 Pro), where I have verified the full stack (SMP, hotplug,
PSCI reboot, and peripherals). For A523, I will ensure it compile-tests
cleanly across all sunxi configs, and then ask you or others on the list
with A523 hardware for a quick Tested-by verification on boot.


--=20
Alastair D'Silva
0493 18 5566
