Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5871E13F441
	for <linux-sunxi@lists.linux.dev>; Thu, 27 Jun 2024 17:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719510861; cv=none; b=gzkj/aa/axqbTwdw5KqpQo2t9QPOGIII2la6da+6+8WTJOPXYes7Pd7uSVp33EhA2DS/wFpASGWmRVCysxJ1EpUNsc0peZvuLxo/nuYIyVp4C8a5bm8ZGJAyzOugzENgsA3AOyi4gTKrt4ILTmk+tCMH0XnKXD+9nr/QETjY6U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719510861; c=relaxed/simple;
	bh=kWAsnel3A5mFApn7lpqazOCEOcFEQnU+u987bPBxcBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OnlbQayknp5I0+C5emLdWeUdoKPG10IlQzmR8I0FFQXU68dOQ7Ixw4Y3P19ULwBhKNZKboBwMeerAObfhHtM3JxfSft7hwh5NTf6BqLuVwYnR/qEmrFzMHCyGkIlNBx2CXwB9YQTNaXcurS6Ia4jS6xUMa83Y4mspEB7bOCPFes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7f3d3f1294dso77709139f.2
        for <linux-sunxi@lists.linux.dev>; Thu, 27 Jun 2024 10:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719510855; x=1720115655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tUDjh8HPRo//13YfMMh5tGFz16cFbmNK3MEKPkttN6E=;
        b=RcWnNXY7psAsRhTtIz0JJbm1eRUnY/kHNBX7y6V0fOqWkGZwNOAIdDCony2b4RyIXd
         CXh67F/Pyqrz9ck+fBhuLxE3CR9EmEVfvm5KMvuchYb342pmaasnjxb8OYT4ONzSYWzM
         sbMiRht4T6QSae/dtEaKImQ5qztKnoJ0GAJ50yY2rCfiThSDWFWdU3P+IIHgsvsd3Kx3
         F8bAz6fcFKaeszXWQ0W/r5sjq7pbXz7xxaabYA6+flCL2EqhWl5FOAaItsxJgVZtPvAs
         5j0coBOsJm209JqhmSrHei7WM/QmpJrhoS691/lN3mQDLepsOCxi1T0p5H+3qczh7+Z5
         4fkA==
X-Forwarded-Encrypted: i=1; AJvYcCVi2SdALKN4qR0FXGkO2OMem7cEEWFbp8831wuOgO47TL6fCZXki84CXqeY/GPHKOHBszK0AvGcWdI7/Y7oLYPwgywsgIyH7kIK7jU=
X-Gm-Message-State: AOJu0YxLP2O5ZmQ7LLKjOopTIJhCwXoB4exmSqpxnR2oSSkXjAdolRSf
	FoMxmgBhxPhi2pn1t+7vNNqMZCnmcND2VB3UqroD4x4zeNRGEzsHELGVJVE3Oks=
X-Google-Smtp-Source: AGHT+IHFWV3U9faIB4Vht8Ofby0dt+co8hNIGZiOHnQUZqSRt4rCrs7RHxlxyfqiOflS0Chz1IffVQ==
X-Received: by 2002:a05:6602:2c04:b0:7f3:d714:53d8 with SMTP id ca18e2360f4ac-7f3d7145682mr516939339f.14.1719510855091;
        Thu, 27 Jun 2024 10:54:15 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-7f61ce9d5b6sm2208339f.12.2024.06.27.10.54.14
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 10:54:14 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7f3cd2c0a79so92682539f.1
        for <linux-sunxi@lists.linux.dev>; Thu, 27 Jun 2024 10:54:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9C06I5jgpbmasZbHjh8Za4DXywdIL1KvKDWcX0szNB0uym6MsMoCT8aUq9hFPWBFuSzuHcZ3FFRaFkjb1DwX7AtGnqaUL5yDB9iU=
X-Received: by 2002:a05:6602:6d8c:b0:7eb:c7ff:26e6 with SMTP id
 ca18e2360f4ac-7f3a75b3440mr1645762339f.15.1719510854318; Thu, 27 Jun 2024
 10:54:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240624232110.9817-1-andre.przywara@arm.com> <20240624232110.9817-5-andre.przywara@arm.com>
In-Reply-To: <20240624232110.9817-5-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 28 Jun 2024 01:54:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v67qo7qgf2uzBAUf9-C9NHrHG47mLc579NRkTO7qLDtV7Q@mail.gmail.com>
Message-ID: <CAGb2v67qo7qgf2uzBAUf9-C9NHrHG47mLc579NRkTO7qLDtV7Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: allwinner: h616: add crypto engine node
To: Andre Przywara <andre.przywara@arm.com>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryan Walklin <ryan@testtoast.com>, Philippe Simons <simons.philippe@gmail.com>, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 7:23=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner H616 SoC contains a crypto engine very similar to the H6
> version, but with all base addresses in the DMA descriptors shifted by
> two bits. This requires a new compatible string.
> Also the H616 CE relies on the internal osciallator for the TRNG
> operation, so we need to reference this clock.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h616.dtsi
> index 921d5f61d8d6a..187663d45ed72 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -113,6 +113,16 @@ soc {
>                 #size-cells =3D <1>;
>                 ranges =3D <0x0 0x0 0x0 0x40000000>;
>
> +               crypto: crypto@1904000 {
> +                       compatible =3D "allwinner,sun50i-h616-crypto";
> +                       reg =3D <0x01904000 0x1000>;

The address range only goes up to 0x019047ff. The other half is the
secure crypto engine. The other bits look correct.

I can fix this up when applying, assuming the driver parts get merged
in the next few days.

Chenyu

> +                       interrupts =3D <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_CE>, <&ccu CLK_CE>,
> +                                <&ccu CLK_MBUS_CE>, <&rtc CLK_IOSC>;
> +                       clock-names =3D "bus", "mod", "ram", "trng";
> +                       resets =3D <&ccu RST_BUS_CE>;
> +               };
> +
>                 syscon: syscon@3000000 {
>                         compatible =3D "allwinner,sun50i-h616-system-cont=
rol";
>                         reg =3D <0x03000000 0x1000>;
> --
> 2.39.4
>
