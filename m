Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48C435975
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Aug 2026 12:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787403039; cv=none; b=q2/DrXMa3lwzRR0oyvtYQxeCCt0LCug9wAaX2k0fz5HPrdBimjBCQjouw3icxE9qkAepTxipdZAza71ig5LgsL2RVy4mkRBhI8JO/ku+Azbjxsz1MRydg0Ld3oo8EA3/El5GBbOQsP/Rqf6858Mwzu4xKTJmek75UN1sc3C7rCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787403039; c=relaxed/simple;
	bh=IJB1MrcPJxoeEn0McrOV55WIUtMbgs3FcA1EwQMZ18Y=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=XuZTfouqvbUEg7lmDBLD22ai2/4ofN3e6TRXFlPlTwenljlNvQQSVmD2RBd8oSITlpeZ69CKUyS8s5DP3bFCiNs95apvhsRsfMJUJ9yuSK4WF/ufTP1V9KHQsxzRm9sTfmEFR7XVUCwSC/WBxEJ9Uy/2oPeh7QX3vfr8t8IpGCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bU6Rz4ca; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bU6Rz4ca"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C641F000E9;
	Sat, 22 Aug 2026 12:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787403034;
	bh=K1ZmojAzXCCU6n78j4xV6zVZT+kuiPeVpiZas6CXf2I=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=bU6Rz4caAQCKsyyxsWxW9vNKe6AO77Z4S4xvpZBLMloJ99FlSDZtsfZyptDjunkZH
	 J5edyIe3aWn/ctsydeCKFyhQI7VfqtNVEY+vLW9bltLcSPCywrHjSBUrhtdblWKTZ0
	 y4/RzHC21+auBAoU6Iug5VhGmbkw94x8ECBwAGIe0J8kxMiEjgCoHrXNm0okbyl7Dk
	 XYmmuAStJT3JHvnzXQ2aiQ0X7PHiZmuZ49d7jdZChpVF4WKaA0sXfxYZyguluVdMJq
	 GPElc+8uDVz51idlGM1u9NQqJoBbVCxizxdJTcFf2lFqQ3f7Ko/isP7a2Sayes6S6F
	 uN2zcpKLo+0qA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 537B11980070;
	Sat, 22 Aug 2026 08:50:32 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Sat, 22 Aug 2026 08:50:32 -0400
X-ME-Sender: <xms:FpuJatQ6BZWHizWs5SCjHMnPjx9Tkq70ML_gOC002V7eZkvlmUtGhQ>
    <xme:FpuJahlYExUsPxitasK27jjIZQ8V7ui0DSs-74Qh7jyOmcP1BExGHjDFhFGkkRyQ2
    ewZBCDVtI75TYTuHhJp7UobMVtjPlMCkHPy3BOe-uS-yRhrLJ1CjZ4>
X-ME-Proxy-Cause: dmFkZTFFbC7IrnJRDaeeGi1YZkL8ONICaLXnbBzyeoWzkly2maw2UsU7UFHbJv6MUCXfMw
    d5gYSxfbLFTa0GzeQJwviB5f9Hj0UUAsCmQ5FbU5dbqQF1oRrjqSAv53nZWXpgkWuVpLC+
    doCou6PapOoAitd5D/iKN7lWnIcFa5YgexuNnPvsgSlKmJtPnoD5MR8vyPwaXMyDyIK7dl
    8X7fB9SeItwPE/6QTJ+jyB6oeUBC++Ji3p5HrSRS2DSZ0K65SBFBESMBFxTEhsImXsRLXf
    OAloMFQ+iRUUD6i8ggeqhD5OjHDN47LgMVIbzs8Sv/94Mz8SYjPghhCmzxM23ELXExIpAY
    fQMpdFZhuC2/dys7nG0aLEcpMNEyqwTnt0AQVYePY34g/0FhjZNoQ2U1FXs3QpGpB5EwVK
    VpICmkr2RPkC28ZcdguWptrMB6aMezycpRegGL+6lRMbOfaUyGH0AOp1F2+cRZjKWelHIe
    GzQ606ScfGRwptMw3Egc8pITAOOnjBhwMLYtdGx9Cxc2PR2OUHArDnL8AtYjuTimzsRNOi
    eUGxPid9FHPafb4yhltheMimbR49/ch1gh5nRuRnq5b0yTB/IC90mWi26ufBmDkBFLRG2/
    h4GTp702+oJ5FNlYy/le+7gnX2xi98xCDEWSwWtzWxBRezswJoQsKTFUnHNw
X-ME-Proxy: <xmx:GJuJagARm_FDnbz8E7vQFdtC5yrwuCr1eumDf161z8uCqZKPZZ5HYQ>
    <xmx:GJuJalEdAA9CSAyKjbhANDE-UIFCup9FQN6-HNFKjrZsp4akUX2kCQ>
    <xmx:GJuJanMWLUmIN74EH0PYsQodqQjBBph49CU9GwAeVFKcg6VFr139VA>
    <xmx:GJuJam6W7iPsOcCIVZJ6skCd23DP86CjvjxyI9xnjwATgn9p_K6HpA>
    <xmx:GJuJaqgQpTpVl847O7OgW-Hn6vizN0ICBxYExGgBjgSTtlU_dj8yC8JO>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id E9B13F80070; Sat, 22 Aug 2026 08:50:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sat, 22 Aug 2026 15:50:09 +0300
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Chen-Yu Tsai" <wens@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 lkml@vger.kernel.org, "Jernej Skrabec" <jernej@kernel.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Message-Id: <15d76cad-2c02-48cf-8071-b7b60e854298@app.fastmail.com>
In-Reply-To: 
 <CAGb2v640LRCYpRq8omyRirD4CUSd2mjm72EJ9FtWvZe=Vovg1A@mail.gmail.com>
References: 
 <CAGb2v640LRCYpRq8omyRirD4CUSd2mjm72EJ9FtWvZe=Vovg1A@mail.gmail.com>
Subject: Re: Bug: PHYS_OFFSET no longer points to DRAM physical starting address with
 CONFIG_ARM64_VA_BITS_52
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello Chen-Yu,

On Sat, 22 Aug 2026, at 15:39, Chen-Yu Tsai wrote:
> Hi,
>
> On the Allwinner H6 & H616 SoC (and likely others), if running a kernel
> compiled with CONFIG_ARM64_VA_BITS_52 and CONFIG_ARM64_PA_BITS_52,
> PHYS_OFFSET no longer points to the start of DRAM (0x40000000) but instead
> points to 0xfff1000040000000.
>
>
> I've observed this for quite some time but hadn't really nailed down what
> was going on. For context: the IOMMU on these SoCs can only do 32-bit
> addresses, and that's pretty fine since the SoC only supports up to 4 GB
> DRAM. However the DRAM starts at 1GB offset in the physical address space.
> We want to be able to map the highest 1GB I/O virtual address space and
> thus need to check if the physical address is within 4GB without the
> offset. Having only 32-bits addressing, the address will wrap around fine.
> So we check the address against PHYS_OFFSE, which breaks with the mangled
> address.
>
>
> I suspect this is the result of the following commits:
>
>     7bc1a0f9e176 arm64: mm: use single quantity to represent the PA to
> VA translation
>     9684ec186f8f arm64: Enable LPA2 at boot if supported by the system
>
> The first commit introduces a negative (wrapped around) offset to
> memstart_addr (PHYS_OFFSET) to work around mapping restrictions, and the
> second commit makes the offset dependent on hardware.
>
>
> I hope that Ard and the maintainers can look into it and make PHYS_OFFSET
> always point to the physical start of DRAM.
>

On what basis are you claiming that PHYS_OFFSET must always point to the
start of physical, non-secure DRAM?

On arm64, PHYS_OFFSET is the physical address of the start of memory,
where 'start of memory' == PAGE_OFFSET, i.e., the start of the linear
map. When running a 52-bit VA kernel on hardware that is not LPA2 capable,
the hardware does not support mapping memory at PAGE_OFFSET, so it is moved
upward in the linear map.

I don't quite follow why you need to compare with PHYS_OFFSET in your IOMMU
driver: could you elaborate?

Kind regards,
-- 
Ard.
