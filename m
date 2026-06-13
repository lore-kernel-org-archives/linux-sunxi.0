Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FA43C7E16
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 08:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781338956; cv=none; b=m7uhoYBTgZggxxt7B0ukqTkJwU00vrAnV1Lj0Gqxl9EyNwbC1faLI1imB49G3DxuC6RZVBF0+Xu3Wgwpw+nLefDVmtXlm4qIhuWlWT5yD+5nnh4hm4l5CV9jp6jIlnhUogLfmrhs0P+xobK+z9rbTrz6sQOY3yj+pntVCrbYCws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781338956; c=relaxed/simple;
	bh=5BOSuS+iU7vFYlQwtmoDD7uZ06WyRq2X9XCUtj9GmXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NCzLVxGzK1e7Gz+5bYJjCWd/FHOGOLroHICSnQEpNHUm4l2GWEEzaceXyuw1/7VuH7xK9caAHARjE1NtlHGtjTKkil10jxjUUCXAwlJ24nOpLYuur+EUW1pIJS8OU2VkeF71h2FcDp9hlx4sH1NNs/EsGXvL++0c+HuHs6Y1JxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oRZ31D2c; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oRZ31D2c"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45fe59255beso940687f8f.1
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 01:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338951; x=1781943751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDCfgIsCd0Q4hB2aGkv+tHe8owWljtqt1jPIzUxxB/s=;
        b=oRZ31D2cNu6sBgtJo8SeVhBhNXqV1WWoa8tr9pcrl1D8Dc0tyfYrWV25qa6hwvrpx/
         ybtc01ZfmZcQi1Vyy9LVThPhCl/EJhib4rDK+Y4AfTu07pJpSYegOx1thAOjPZbxqfAE
         3Ri0JbAR9EZbwRtabbFmQJh8q6+QUnsMVpFg89ukq1kuB2Q61r3upTJgJS9WSpeYKwya
         oTR+AdQ8/9cZhIdavcB4fR9Yi2zP+ZgD5njR25S8QvfKu7g1LkjQ56SWWFehLHKAXHC4
         1ba52brChrheROulQHAtIgD/5IJEHsjbJRzvLoPE5E5yiP51OLw5IQvJbtKMccnbzqmp
         UHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338951; x=1781943751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aDCfgIsCd0Q4hB2aGkv+tHe8owWljtqt1jPIzUxxB/s=;
        b=EKs9inYloqlI9/qGtTVhYS6d1XdltKjaGYegJPxOwtEbgeYajjIazGx1RPykvB21NE
         NHSIDfsbifqqMZUChLIgr3bRiGtmLkDWBumwMTAOPHIQ12BsEpw/x3M3jxbjjkQmXcRM
         P0rK8pju2lVoCgGvvaj31KFVyWCRbB4SUmQRmsoHdPZjUoxDeA16hs3hMBNECisdjiuA
         Lc0c38nepeaPN8m/WYOwuH7GF0aqHVyJeNvG3LPGR+XylqS8gDIUDjWtIYN10L2V2WL5
         5FdB7ov/vGDFvoAao8KCQ/OwugMbnAPLmom1zc9g9Zb/Ichmfgx6Nic/XWqEvN+O+m0P
         0V1w==
X-Forwarded-Encrypted: i=1; AFNElJ8AgmzwqIB0LYP+QlU4y0Lwk0J7D72SQNoY3VoK0oikOyRzKedA4zYv/OEj/e+1bF+jFLjQyFRsi9xhow==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPLvz+W2o//Q3n3EX1/cK1dqpga/ug9m6kTNTv2rgmZtkJNi4R
	it8Ft0oODkqurgkYbAQA8FCpXdUmTZqmrXBA4xkRtoimrMsXYJ0qiKel
X-Gm-Gg: Acq92OGFIFXVJaFuL8YRPHNSirlrHvZFPs3HmHbX/i+nhD5+Y2VDtHPEb8IHHPJJAVb
	h0eMx6YHFQVVRS/etL4Is2JkbtJ6Y4DW3zANwo1DNMMcnq6YtkenWp0+TEVguiPwgTBkxu3lE/D
	ssZVhUEGKyR73FqnTuSmAbreYvpAcsvEseVznhwXtBjmLDqVN3YMHdHTmj92WXSKvR4XMuVSF2o
	/3dwbXk7xjON20dPJGu3XOuDCh3z63OJo1rrIjtXzoWZXAmJaGc/soaFs9GpfcZR06sgEJNuG7M
	/rsHU6hSRnOIGnpS4/P2hzNCkU40wIvpIixDEHuZWKgS7ngO3pW265Xc0NzTJ0t6P8oRZHLBxQU
	wCAX1/boRyvJ+O4EXPPeOJDE9639/l3bYrGP3CqQbOANqWXmGJ9KHjtC9nCEVp760nnRsOGkPfy
	7JPajq94MgZXYkOafK40JfTVX9PKASyRu1VOorZO/L1NO1IoxS198s9Wk=
X-Received: by 2002:a05:6000:608:b0:460:70ae:f196 with SMTP id ffacd0b85a97d-46070aef211mr8420172f8f.7.1781338951277;
        Sat, 13 Jun 2026 01:22:31 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f3dcsm12723144f8f.13.2026.06.13.01.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:22:30 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>,
 Eric Biggers <ebiggers@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Luca Weiss <luca@lucaweiss.eu>, Sven Peter <sven@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v4 6/7] arm64: dts: allwinner: a100: reserve RAM for ATF
Date: Sat, 13 Jun 2026 10:22:29 +0200
Message-ID: <_6NEZ78hR8a_3V2bhBAGoQ@gmail.com>
In-Reply-To: <20260605070923.3045073-7-alexander.sverdlin@gmail.com>
References:
 <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
 <20260605070923.3045073-7-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 5. junij 2026 ob 09:09:20 Srednjeevropski poletni =C4=8Das je Al=
exander Sverdlin napisal(a):
> Add reserved-memory node carving out Trusted Firmware-A region spanning
> fixed 256K from physical address 0x40000000. Even though Allwinner ATF
> itself passes the address range in the fdt to U-Boot, U-Boot currently
> only reserves this memory internally, but doesn't carve out the region
> in the fdt passed to Linux.
>=20
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

NAK. It is job of boot procedure to properly inject TF-A reserved node.
Any issue should be fixed there.

Best regards,
Jernej Skrabec

> ---
> Changelog:
> v4:
> - new patch
>=20
>  arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-a100.dtsi
> index 7cb06b19b5a5..d8391663fd1d 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> @@ -87,6 +87,22 @@ osc32k: osc32k-clk {
>  		#clock-cells =3D <0>;
>  	};
> =20
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		/*
> +		 * 256 KiB reserved for Trusted Firmware-A (BL31).
> +		 * This is added by BL31 itself, but some bootloaders fail
> +		 * to propagate this into the DTB handed to kernels.
> +		 */
> +		secmon@40000000 {
> +			reg =3D <0x0 0x40000000 0x0 0x40000>;
> +			no-map;
> +		};
> +	};
> +
>  	timer {
>  		compatible =3D "arm,armv8-timer";
>  		interrupts =3D <GIC_PPI 13
>=20




