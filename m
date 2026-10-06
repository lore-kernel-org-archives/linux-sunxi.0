Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014903AA1BB
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Oct 2026 12:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=119.15.109.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791289347; cv=none; b=opcOwXQvZpqfzlv/pND5rDLBzGo79trb/+QW2yD+5JE1YhOe/gGLWeGZNqjjidVPRY7QyQ9knS6PpMyQp3N5QYUYQZmWKeODbVQeASNWFaw1eR7voGrTMJbQq/lVogqdUvIZeFExG2fSAxWdRSIEe/yy4W6Ahn8/zBRucTNrbpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791289347; c=relaxed/simple;
	bh=YplGbF3iuD94IgnEW3S0fPyQ73CBw677bsAYWGaMc6M=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=elY4cM95mwzL5cfNK5pjiRYJUgSUmkG9sZFBx8Jl9Bi2chxklagK4K9IiUtb188Y8xxFcBiDcFMtKTUTNonmVxgT4xGop04rOuWwAWmZuy3RSjFVR4KLp/VO7OKlTt2UoF1mTZ5n8mOlZ4+kxHjuxVtCrhGRT/O1YCqBS50WcbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org; spf=pass smtp.mailfrom=d-silva.org; dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.b=cDtaOKNP; arc=none smtp.client-ip=119.15.109.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.b="cDtaOKNP"
Received: from hawking.lan (ntp.lan [10.0.1.1])
	by www.nmnhosting.com (Postfix) with ESMTPSA id 7F7FD405B2
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Oct 2026 23:22:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1791289325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=/cSVtyM9FBrN0S4VjZHpBjHV5PEGkWiQJ5S0wheXU0Y=;
	b=cDtaOKNPZ4VgNpSr/4j31Xqb7/moXSDPK5LhiOa5hpDZa7h3dpopxBszimllNDWOSBFQJB
	d+d3/iB7VDfBX7et9rrjfeRwmzrvqYZx/xADoatMxFrksXRDjjo7ve9MxCYRHK1fzZTYIn
	HGDU5s8sujkM8GSMwpX2hz2ST7vaEBXUF1N2iihVtrakYsQ9PhJaQY+yjO3gF9I/bD8mv7
	7BkLs+0hOKWqiCNtoD9eHgn7hh/zxm9NffB9nBIn+YdwJRY0gFi6brh7u3RBZcITNFGYxE
	IOR4RQSvy6SvKYeS+qR6NLBWs7QwHjern/O+Q6ry0eaRZykBbrSmKtOt+80oWA==
X-GPT-Reason: legitimate; the email is a highly technical, peer-to-peer
	engineering communication regarding open-source firmware development
	(TF-A/Allwinner A733); the sender identity (alastair@d-silva.org)
	matches the personal/business profile provided in the context;
	the content includes specific technical details (commit IDs, memory
	addresses, hardware specs) and links to legitimate GitHub repositories
	(github.com) rather than phishing domains; there are no urgency
	tactics, and the request for coordination on review.trustedfirmware.org
	aligns perfectly with a professional software engineering workflow.
Message-ID: <c8d7c508075e081219a0ed9ec8650aebade205db.camel@d-silva.org>
Subject: [TF-A / sunxi] Allwinner A733 (sun60iw2) TF-A Support & Validation
 on Orange Pi 4 Pro
From: Alastair D'Silva <alastair@d-silva.org>
To: linux-sunxi@lists.linux.dev
Date: Tue, 06 Oct 2026 23:22:05 +1100
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

Hi Andre, Jernej,

I have been working on upstream support for the Allwinner A733 (sun60iw2)
SoC using the Xunlong Orange Pi 4 Pro as my test vehicle.

Building on top of Jernej's in-flight A523/A733 groundwork (specifically
commit 5bc9605cb "feat(allwinner): add A733 support"), I have developed
and verified a clean 6-commit series that completes BL31 enablement for
the A733 without requiring vendor out-of-tree SMC hacks.

Summary of What Was Implemented:
1. Disable SCPI in Favor of Native PSCI:
   Explicitly sets SUNXI_PSCI_USE_SCPI :=3D 0 in sun60i_a733/platform.mk to
   avoid compiling unused SCPI driver dependencies.
2. Generalize SUNXI_BL31_IN_DRAM and Relocate A733 BL31:
   Because U-Boot SPL on this SoC is ~136 KB due to embedded LPDDR5 PMU
   firmware, SRAM headroom is insufficient for BL31. I generalized
   SUNXI_BL31_IN_DRAM to allow platform override of BL31_BASE and
   BL31_LIMIT (placing A733 BL31 in DRAM at 0x48000000), dynamically
   named the reserved-memory DT node (tf-a@%lx), and added
   common/fdt_wrappers.c to allwinner-common.mk for SUNXI_AMEND_DTB builds.
3. Dedicated 4KB Per-Core Stack for DRAM BL31:
   Enlarged PLATFORM_STACK_SIZE to 4KB per core when SUNXI_BL31_IN_DRAM is
   enabled.
4. Cortex-A76 Silicon Errata Workarounds:
   Enabled applicable Cortex-A76 errata workarounds in platform.mk for
   the performance cores.
5. Security Controller Un-gating:
   Configured the Security Permission Controller (SPC) decode ports and
   bypass register, CCU CPU interconnect clocks and resets, DMAC0
   security gate, and dual IOMMU auto-bypass in sunxi_security_setup().
   This eliminates the need for vendor SMC fastcall backdoors
   (0xC000FF05 / 0xC000FF06) when running normal-world drivers.
6. Per-Core Security Re-arm on PSCI CPU_ON:
   Added sunxi_security_setup_core(core) to re-configure only the waking
   core's SPC decode port in sunxi_pwr_domain_on_finish(), avoiding full
   SoC peripheral security re-initialization on hotplug.

Validation on Physical Hardware:
I verified this series on actual Orange Pi 4 Pro hardware across the
entire software stack:
- 8-Core SMP Boot: Clean bring-up of 2x Cortex-A76 + 6x Cortex-A55 under
  Linux 7.x with dual-cluster cpufreq.
- PSCI Dynamic CPU Hotplug: Verified cycling secondary cores 1=E2=80=937 of=
fline
  and back online under load.
- PSCI System Reset: Clean reboot via PSCI SYSTEM_RESET.
- Hardware Qualification: Passed full automated qualification testing
  across all SoC peripherals un-gated by BL31, including PCIe Gen3 (NVMe),
  Display Engine 3.5 DRM, GMAC, SD card IDMAC, Crypto Engine V5 (HWRNG),
  NPU, THS, and PMIC.

Related Repositories & Test Environment:
For reproducibility or inspection of how this integrates end-to-end,
the corresponding branches are available here:
- TF-A (sun60i_a733):
  https://github.com/InfernoEmbedded/arm-trusted-firmware/commits/sun60i_a7=
33
- U-Boot (v2026.07 rebase with 100% open-source SPL & freestanding C PMU
  firmware, completely replacing vendor boot0 blobs):
  https://github.com/InfernoEmbedded/u-boot/commits/feature/sunxi-a733-oran=
gepi4pro
- Linux Kernel (7.x edge with A733 DT and driver support):
  https://github.com/InfernoEmbedded/linux/commits/feature/sunxi-a733-orang=
epi4pro

Upstream Coordination:
The TF-A commits are prepared with Gerrit Change-Id headers.

Jernej, Andre:
How would you prefer to coordinate this for review.trustedfirmware.org?
- Should I submit these 6 commits to Gerrit as dependent changes on top
  of your A523/A733 branch?
- Or would you prefer to squash/fold these fixes directly into the base
  A733 submission before pushing?

I am happy to follow whichever approach works best for you.

Cheers,

--=20
Alastair D'Silva

--=20
Alastair D'Silva
0493 18 5566
