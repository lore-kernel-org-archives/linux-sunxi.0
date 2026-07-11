Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A772620DE;
	Sat, 11 Jul 2026 14:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783778896; cv=none; b=kahqElA0sjBUmj1OPSSpFnWY0PpYHuH7Gd/iDQNQd9zHFz/y1Tn3/WE/Ru2CZ31upah1ZiLizI6az1MjshDM1ua1MKR3RAG9kn9xvwlWkDma56OYuWu/RsmQdrO9e2q9QO5nUsCsHIeunzquOb5UCcPQXPL73Rif/P3T2BliVT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783778896; c=relaxed/simple;
	bh=QlKi8EN7t0woe9SaDZPELCBC7ZCrdul+E7NVhTaDMgs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Pgjz8t8Sc1770M/35pXqGsip9gjz7/J0cl1q8Cf9gpBjhtK0+ldL87uFA+O0MN3MV0I+8O6DwfOHZPIEHN2BfWhwaUwuLjQMec4IRlGUtBpfN8PHeVhE6nmITOYj/fDkmuMdDmryYWBEBbJHvImknPbp6iX18f3WzUkcplpViPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hnXb+iQ4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hnXb+iQ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C4071F000E9;
	Sat, 11 Jul 2026 14:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783778894;
	bh=pKtvhA5C3zLRLNRn1ojKJcWRt+4D42Q7oTStrODDBCo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hnXb+iQ4jlfMsr5MQiE46AdJAl46Bjb7jtXW3UTm12x6cXOC2rN/zGcoXcVkWyzBe
	 h8xybsNp5jhxIgxPMNGGf6BVS3h2485ck+jGhg+h3FpcruC0bh5Muis19/oDEv+CXa
	 8IBCn75+IV81uImvMRaGMUqFUKKUxWYZbROkr9boL77Ref0cvR1txHnVv/y0UzgR2R
	 ZhnutVxDuJj5DsnDbbaXLbT64duXERB3TRpNtDozWo9wbG6deQJmKoSmM1EeIfn1i1
	 jkMfPT/XsNePZMR+hB40B4pCBWBRumdUKCA/kFqHhC8C7A1UCPww4L9OyMdn82gESh
	 rYWe+68rmTApg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: allwinner: sun50i-h6: Add missing
 IOMMU for video engine
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wens@kernel.org>
Cc: conor+dt@kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260711135959.3616919-7-wens@kernel.org>
References: <20260711135959.3616919-1-wens@kernel.org>
 <20260711135959.3616919-7-wens@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 14:08:13 +0000
Message-Id: <20260711140814.5C4071F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The sun50i-iommu driver fails to properly detach domains from the =
hardware due to an unbalanced refcount, leading to a use-after-free of the =
domain structure.
- [High] The sun50i-iommu driver assigns a separate IOMMU group/domain per =
device despite the hardware only supporting a single global translation tab=
le, causing devices to overwrite each other's page tables.
--

--- Patch [6]: [PATCH v2 6/7] arm64: dts: allwinner: sun50i-h6: Add missing=
 IOMMU for video engine ---
commit 8a79dfe07f469620b0b60592b02052d1c198fe97
Author: Chen-Yu Tsai <wens@kernel.org>

arm64: dts: allwinner: sun50i-h6: Add missing IOMMU for video engine
   =20
This commit adds a missing IOMMU port ("VE_R") to the video engine node
in the sun50i-h6 device tree.

> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/bo=
ot/dts/allwinner/sun50i-h6.dtsi
> index 88c6e3e105c07..48c771223af4d 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -206,7 +206,7 @@ video-codec@1c0e000 {
>  			resets =3D <&ccu RST_BUS_VE>;
>  			interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
>  			allwinner,sram =3D <&ve_sram 1>, <&de2_sram 1>;
> -			iommus =3D <&iommu 3>;
> +			iommus =3D <&iommu 3>, <&iommu 1>;

[Severity: High]
This is a pre-existing issue, but does adding a second IOMMU trigger a
use-after-free during device unbind?

Looking at the sun50i-iommu driver, sun50i_iommu_domain_alloc_paging() sets
the domain refcount to 1:

drivers/iommu/sun50i-iommu.c:sun50i_iommu_domain_alloc_paging() {
    ...
	refcount_set(&sun50i_domain->refcnt, 1);
    ...
}

Later, when a device is detached, sun50i_iommu_identity_attach()
decrements it:

drivers/iommu/sun50i-iommu.c:sun50i_iommu_identity_attach() {
    ...
	sun50i_domain =3D to_sun50i_domain(iommu->domain);
	if (refcount_dec_and_test(&sun50i_domain->refcnt))
		sun50i_iommu_detach_domain(iommu, sun50i_domain);
    ...
}

Because the reference count drops from 2 to 1 here, it fails to reach 0 and
bypasses the domain detachment. This leaves iommu->domain as a dangling
pointer which is later freed by sun50i_iommu_domain_free(). Could this
cause a kernel panic on a subsequent IOMMU page fault interrupt since it
dereferences the freed pointer?

[Severity: High]
This isn't a bug introduced by this patch, but does adding another IOMMU
reference here break DMA due to a single global translation table?

The sun50i-iommu driver assigns a separate IOMMU group per device:

drivers/iommu/sun50i-iommu.c:
static const struct iommu_ops sun50i_iommu_ops =3D {
    ...
	.device_group	=3D generic_single_device_group,
    ...
};

Since the hardware only supports a single global translation table
(IOMMU_TTB_REG), placing every device into its own independent group and
domain means multiple devices will repeatedly overwrite the shared IOMMU's
domain on probe. Will enabling this second IOMMU port overwrite previously
configured translation tables and corrupt memory for other devices?

>  		};
> =20
>  		gpu: gpu@1800000 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711135959.3616=
919-1-wens@kernel.org?part=3D6
