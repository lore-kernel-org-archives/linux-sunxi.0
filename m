Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E52C3EF0B4
	for <linux-sunxi@lists.linux.dev>; Mon, 11 May 2026 16:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516261; cv=none; b=tL7QnjjB541zEa36xXpX0TX4FjxXE0Czl0m1cRB3dTKkhIsQD5QXih1SQjpaaSvReY2IajXdEgGM/wM6ECvMHEZtP6Nlo5vpG4oi7xuZQEnfVlKMFAGVeyd+yPaAhwRHWQLVl6JMKNXPiUuI2+7qSLRwxDMHm5lX6QN9idghM6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516261; c=relaxed/simple;
	bh=snIcOk1xMSTaa9lMcB3wIhJWh+KSiFp8e1pKlLk1omE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jBI3i9GCqum0XKVZINkKmoGAJcfnt9bNf6bZRMC+c7p1uANtYztPT53L4obfWcOiItS583bcLmFhcBKSQtPt87IhisFmNLtlvPPsmqfMulg/8dTEEkwV7xqDiv8EdBvUfRCrP6/kBLLlp5zwfEAmCd2OC8sahw22UfuLqe+0NhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjLOZYfR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjLOZYfR"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso41447545e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 11 May 2026 09:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778516258; x=1779121058; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=snIcOk1xMSTaa9lMcB3wIhJWh+KSiFp8e1pKlLk1omE=;
        b=CjLOZYfR4dTDmHEYHWAvvgp4VbrLbEGCt2VD7/erqPuw0O7z567Qbjlb2kLKg9biAN
         LuNtBIlpOY7Qv2a+x6b9QNxRPQyTGm3MxW2alXzubhnnl03K7wGILiy6RREjUqt5hHby
         acoWkRF0XNuA1+qAiGoje/Ei3TOiY2WLn5AcPMfPBiCBp/J1k5uVnwNKOORXRcklVuhg
         hfIFok6pmZ9A3AcV33Hp4lEB3e/TYkC8BcPx2AhU7fS1aFWJSN9xZB/+QYecuAXEdZLw
         8OR2kaIVF0ELgdMtxkCJYipRD2C9tWdN/4A6ylooyein2/KwPiCSiyJgo3RixgWQZAHl
         cMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778516258; x=1779121058;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=snIcOk1xMSTaa9lMcB3wIhJWh+KSiFp8e1pKlLk1omE=;
        b=lzIOK2SrANma3qMjltW8gqETJFzSbNlX6h+tJLPpEBMav8BVTGfAPUVZjCnXTSE+t3
         VBCf6Yy3yUUi67Xo+o4wszuSvetsHHrMYolSmxOGDd/az1C05pMNJBJjceOGWO0ucKWM
         1v+9eCn4e3WYhvEwUVkcDaoCZT2wD2j2S/49TAv1xdxuqc4KgCQSyW07EXS8b30VpB+n
         g3DO8a3p3aoqNHcdtQOKP7ShXofmwfxUeAVHkxQIFshqtI/oEwnUwmafiE02eMISuDkP
         9a5+erv+B0XDVs4MQSzlLOOi8FGhZNQOsnOuotVONDRXamngoa2RrajxZhf0VTUqmMHn
         CV1Q==
X-Gm-Message-State: AOJu0YxpOFjpNZHL8lX1VD6N7O3Zk50oHruSopBjt8YK35wX/sISRm7u
	WvPuo4YVmo2LdYvN+oNdngZYdhfJNrRnW0iXiefp20NDgk5sYQV1f3io
X-Gm-Gg: Acq92OEhWHR7fKivckTgIAPwaP6i+txLiC3k6lBI9ANa+nB6NeLd/e6LPQTNVIJg6mz
	J/5erdzjGyrX6XYlwWGmbvAtOClFR3X6aDhQn57Ex88PTCyrvR445FpIhAQllwA3f1pAi1Znpa1
	n8Tsa+7Uc5d2oA4+92QTLGDGy9Rh91bsRhPCuijcAnuJkHHJkvZtr+ljGokmKhQ3f95Uqk1ICTR
	cPj8UZbWT2OSo8RGAr0Z+hsSWRssbo0FsWECXA9aJjh6lE8AmqQsm7Ggc5EYyVnzQZz9OmjqTfG
	MQWA2nVMZ43BXTefytgC0wHRitWL5DCsK1OCbBYw7dRWW55C5zHtDhgjVgz6DZCXW9wktQhRQE+
	m3VTJkDyooojHQ9bhzpcyqnYr2MtxjaXpySAxnKVMjfVoiemfEJPa+9hGSwDIuLNiJzk+9N+OGa
	euCY4xoYQbv3zQw0dVzk0pUIPYjoXddGrdrlGcEFZhtf3gcEAP5sJ7kfB8RLs1wbfJxiID5q/gV
	oXoWdo=
X-Received: by 2002:a05:600c:47d3:b0:48d:c0a:3813 with SMTP id 5b1f17b1804b1-48e51e0bb62mr257112665e9.3.1778516257805;
        Mon, 11 May 2026 09:17:37 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8e566cf7sm472495e9.0.2026.05.11.09.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 09:17:37 -0700 (PDT)
Message-ID: <d51ab76d9f658aad542fa24651d1083e31628038.camel@gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: sunxi: Add Baijie HelperBoard
 A133 compatible
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Andre Przywara	 <andre.przywara@arm.com>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 11 May 2026 18:18:22 +0200
In-Reply-To: <20260511-stock-elitism-f1f703bee1a3@spud>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-3-alexander.sverdlin@gmail.com>
	 <20260511-stock-elitism-f1f703bee1a3@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Conor,

On Mon, 2026-05-11 at 17:08 +0100, Conor Dooley wrote:
> > Baijie HelperBoard A133 is a development board around their A133 Core
> > board. Introduce a compatible for both the Core and the development
> > boards.
> >=20
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > ---
> >=20
> > Changelog:
> > v2:
> > - introduced baijie,helper-a133-core compatible for the Core (SoM) boar=
d
> >=20
> > =C2=A0 Documentation/devicetree/bindings/arm/sunxi.yaml | 11 ++++++++++=
+
> > =C2=A0 1 file changed, 11 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documen=
tation/devicetree/bindings/arm/sunxi.yaml
> > index e6443c266fa1..d7b9dec81165 100644
> > --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > @@ -96,6 +96,17 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - co=
nst: allwinner,ba10-tvbox
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - co=
nst: allwinner,sun4i-a10
> > =C2=A0=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Baijie Helper A133
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: baijie=
,helper-a133
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: baijie=
,helper-a133-core
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: allwin=
ner,sun50i-a100
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: HelperBoardA133 Core
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: baijie=
,helper-a133-core
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: allwin=
ner,sun50i-a100
>=20
> Does this make sense? Can the core board be used without a carrier?

such operation would be impractical at least, that's why in my v1
Core board didn't have its own compatible. Maybe I didn't understand
you correctly.

Shall I drop the above 4 lines, the compatible property from the
root in sun50i-a133-baije-core.dtsi and only leave
sun50i-a133-baijie-helper.dtb with 3-strings compatible as it is
now in v2?

--=20
Alexander Sverdlin.
