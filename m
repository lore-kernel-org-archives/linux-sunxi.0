Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFCE3AB28C
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Aug 2026 12:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787402403; cv=none; b=FWu9ruH4u7MZ0FP3lwew7My1VUqcG6yrN4FAuCamMw6uaEa5u+CPIarj6IfMUcgV4LsoyWOwtj3AP2J1/DYGFzDgpO1rc2/ZjyZjm9sML5LjDxkjTyDwCYXmrY1JB4flMnFRod1xWeaJIMOu6VUK+x+X7NoNeNt3hGryb6rg5ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787402403; c=relaxed/simple;
	bh=fP1tv9FyNQm2xvxErSSBLGaGtec34FqEFVeEoTIxZV0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=om4HngGtJ+214yh7ghdEeaXAJgPsPR8gwAs9fmao25d2oxwNy3OY0nuKmiuRuHDe9YtDzYL9VjYmKHCQirqEOkN6sVNu7/lF80pf+nHwrc0Eb9wwy+ioLzhQBkJVjuj2Q8G8WAmsZ/Kh41ezemCOnbIwoABezB6bom21W37vO9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XsyBBvT9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XsyBBvT9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC891F00A3E
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Aug 2026 12:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787402400;
	bh=PrJAjZIsjl9UUPWH1CL5InP4eR7gP6Z551S3b2Da1R4=;
	h=Reply-To:From:Date:Subject:To:Cc;
	b=XsyBBvT9XNm4I/fi0uGin8gW8CtriKlUarLGDBkfh7TeFCJGY5P58xvqmBPS+4nC2
	 OD7yIa0QbOyP2y4u4kxIPyDxu+NFQ0xtxdbLKBlZW5z+jIXiCFGSZAISKDYrB4ODuk
	 RgwirKcxvkm+HFnKRkJBhW8Q37/4Qk5w2mtCKeUomY04xU4EBiQexMbLwVplPJVyIa
	 FxZijdNjWzi9S4Zi81Ivsjv/t3AvctBeHLXURnt5PGiUnOLxErp8HSEw1ErOmFXnvs
	 vR1XGMeGtGJEjxeLCFrjEPM7M29pC9qOK59b91ag0yxR+x3HN4pqJIK+W3zgA1YKc0
	 SzbwFK+zj+aAg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c8e65e3f5so17284171fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 22 Aug 2026 05:40:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqP3sxxDL8MnoRLSkuChGb+dPX50vyqkDZucVPt6wNzKLBauRPUHw83nee/+4UXWrf+oektErcCJpypjg==@lists.linux.dev
X-Gm-Message-State: AFuF++kLg27GtFoFm3qUJDVwfjRYgLNhF7LPxATOEn/cFXKCdiNYSg/F
	UNozhIV+sPBn+LlBBPkZl5ah0SRVQ2YV6wEeghKFeomsChOfBbnQqz/Vtm5m2U9JoJ/3bDWABEQ
	BpBk0MuhWUKpMdO1SET6dJzzO3K46gSw=
X-Received: by 2002:a2e:bea4:0:b0:39c:7922:b43d with SMTP id
 38308e7fff4ca-3a1aee84f48mr32697671fa.13.1787402399311; Sat, 22 Aug 2026
 05:39:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 22 Aug 2026 20:39:44 +0800
X-Gmail-Original-Message-ID: <CAGb2v640LRCYpRq8omyRirD4CUSd2mjm72EJ9FtWvZe=Vovg1A@mail.gmail.com>
X-Gm-Features: AcwNN1X0O9LF6pLX5IWOI2SoYEqs1hPU6QRSfUTrpJH9BsWMqiE24CzYyZnH0ig
Message-ID: <CAGb2v640LRCYpRq8omyRirD4CUSd2mjm72EJ9FtWvZe=Vovg1A@mail.gmail.com>
Subject: Bug: PHYS_OFFSET no longer points to DRAM physical starting address
 with CONFIG_ARM64_VA_BITS_52
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, lkml@vger.kernel.org, 
	Jernej Skrabec <jernej@kernel.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On the Allwinner H6 & H616 SoC (and likely others), if running a kernel
compiled with CONFIG_ARM64_VA_BITS_52 and CONFIG_ARM64_PA_BITS_52,
PHYS_OFFSET no longer points to the start of DRAM (0x40000000) but instead
points to 0xfff1000040000000.


I've observed this for quite some time but hadn't really nailed down what
was going on. For context: the IOMMU on these SoCs can only do 32-bit
addresses, and that's pretty fine since the SoC only supports up to 4 GB
DRAM. However the DRAM starts at 1GB offset in the physical address space.
We want to be able to map the highest 1GB I/O virtual address space and
thus need to check if the physical address is within 4GB without the
offset. Having only 32-bits addressing, the address will wrap around fine.
So we check the address against PHYS_OFFSE, which breaks with the mangled
address.


I suspect this is the result of the following commits:

    7bc1a0f9e176 arm64: mm: use single quantity to represent the PA to
VA translation
    9684ec186f8f arm64: Enable LPA2 at boot if supported by the system

The first commit introduces a negative (wrapped around) offset to
memstart_addr (PHYS_OFFSET) to work around mapping restrictions, and the
second commit makes the offset dependent on hardware.


I hope that Ard and the maintainers can look into it and make PHYS_OFFSET
always point to the physical start of DRAM.


Thanks
ChenYu
