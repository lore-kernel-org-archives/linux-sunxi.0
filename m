Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09162F1FEC
	for <linux-sunxi@lists.linux.dev>; Fri,  3 Jul 2026 19:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108221; cv=none; b=F8CalOyYF8oelTVFIhx5B4pays+D/F2p+d32IxPvlsf7cFGSp9I5HSZjoPVP8dwThGxWiXRjn7blcOib7gsD54xmAmYK1Gnk+kLym/XyXTdS0+PGVNrAOCFI1vFQWHnloqeqYBmqv2Ds4mWZlEc/trS/+cCpRETVgtA1zwoIB5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108221; c=relaxed/simple;
	bh=unqNE8MP8lZX5bdNWaLZFUY2fN5TbzELhGKn7b2Dll0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0wux+Ftv0Lk/JDcUVPKqN8vWPeAP8vnCwomdQBewA3NxUqgS/zzjoRz8y3LSV/3kz9AxkcjO+2dm6otzBNdq506/LJEO59/bh6iM5xLtGeU8yQv32n7MyfKwYioJwMv/rdNavsFz0cKPut87Os8vKQa+grtkrmCUwJl+kbxKKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJwwWgRt; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJwwWgRt"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8111c0c7439so6147007b3.2
        for <linux-sunxi@lists.linux.dev>; Fri, 03 Jul 2026 12:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783108219; x=1783713019; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3YDyivCac2qwNApiX3s+EtwOjLvvZwzcM7r8yH4SCHI=;
        b=VJwwWgRt6ZcsquxkgBfvsFYvLhf1RXrVVBr8dC7ZDEIlq0uYXD/1ZBSj6WOOPQ6lEc
         C71k0UpWfBa4o29gANYYibSuvEEiLWUjXa6sXTelsoxyWUfca0AKw38VjEMmpu+TX0LT
         fOA/b5Kp+lZZ/yp/ByQOTVE0/XBvUkfsAj5hheY5y/IjD1u2bOo+s3Wl40wx+UroL7t4
         R7aK4iUUh705Vqd8R1qgA6s2ex66EaZ5IXlQxhREv0mv4c1vmTD+/dfDYy5G+acT00SZ
         R1YjMUFsIT4B3PPCA3zqNiJ3i4T8krWC88JNQFte8NcDkOXZqaEcpV8u6ai9/0vHISNp
         VFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108219; x=1783713019;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3YDyivCac2qwNApiX3s+EtwOjLvvZwzcM7r8yH4SCHI=;
        b=aYq5tPvVnbXzwXdSYUoZfskpfwTm7MSBCdOqcDlLtTwzUZmqqC0sXhHfewp3yXP/ip
         FyiLYGhrJ+NTCT8kActxy/wJP1VheRqlJGRej7qcpWMIyYf55onAMgE7Gw6jFqB8BkBo
         QRNnsTTaJ0riQhp7oA+EEujkwnVl1WrIvOdkyqf/CYZlgFTJ0ECbKkGqLsKcidiiPVjX
         +C2VScng1lGHaIHOwnXNq7mUpgP7u0DUxzdvh1U3gq+hl/Wn4FmsiyOWInkv1aZ1VRwT
         rd169c+yWOwNJJ1JJurhDvEb82F03n7QJvuMIzuvEc2Oxo81R8Rlf90HjYcXbgTcv0PC
         MK7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpsy/v3nAthFHh5ApGI07DP0GnWGXQ30KE1Lx/8vKksGuUS1e6J6tzbhF55VbPamC3WloGxLAnOXE9zMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw03fqcda1Fu1Tgbf598IYmiPiPapgI8Ce4T14QuWRN7tRmMbeC
	yvxzClgYc7szfXFDgRSgBkItyYHiuDDyElQn6zSqBAlWb0itiCFmexN4
X-Gm-Gg: AfdE7cnvXBkxf7QSSJwlBsGN3oD7C73FyN4X9wITJVaB87dLG/7si9kipvSFbcx+kzp
	8NJ/G+8g2k5w9TBAYBiY4ma31FqRrLRnY5EAo9n9Hiy7qQQNL2Ul20D8+hgQFvtbqUDBHjla5Cy
	A+rEEY4H7TRgVGinoaRAtiH5zWR/klMSmN2Nsu0kRRokQTsRdIFuOLVI63QeZXVjuazYelWdOMg
	V1ehQ9ExQDG4vFNN4HdMtPA4xz23mXDEBicSV1Z55OdMFDQDVne1qRtUDqHbNTGhrIjoJIzPRpO
	weTMns600sbMVOdDxrNsmA6iij5neUk5Q7VDUgCAQ2RnheAz4F9mk+x1gYSCH8F657X8QEe2dJ5
	/DfynYQB+B2uuDeFVaTwao9zlXag3phAFP4dRpHCa75dHCX2FSrQI3XTIzjs9Z8QqiU5ySKmpxe
	/bDQw1Xbr5C6/s03jyhmeuvGRoDW37dDAtjSby/ot7VWBS44s07A==
X-Received: by 2002:a05:690c:45c2:b0:80c:85b6:7650 with SMTP id 00721157ae682-8173abb42cemr6694927b3.69.1783108218436;
        Fri, 03 Jul 2026 12:50:18 -0700 (PDT)
Received: from suesslenovo ([24.176.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144b049939sm27500667b3.32.2026.07.03.12.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:50:18 -0700 (PDT)
Date: Fri, 3 Jul 2026 15:50:17 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add A523
 compatible
Message-ID: <akgR7N1LmqEmPSLy@suesslenovo>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
 <20260702214750.3428694-2-utilityemal77@gmail.com>
 <20260703-versed-locust-of-agility-d76fda@quoll>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-versed-locust-of-agility-d76fda@quoll>

On Fri, Jul 03, 2026 at 12:56:00PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jul 02, 2026 at 05:47:47PM -0400, Justin Suess wrote:
> > The A523 (sun55i) contains a newer revision of the sunxi CIR receiver.
> > It is not backwards-compatible with the A31 programming model: the
> > control register has a pulse capture mode field (bits [7:6]) that
> > resets to a value which captures no pulses at all, and the sample
> > clock divider is now selectable via SPLCFG bits [1:0] instead of
> > being fixed at the old module clock / 64.
> > 
> > Since a kernel driving it as an A31 CIR receives nothing, add the
> > compatible as a standalone entry rather than under the
> > allwinner,sun6i-a31-ir fallback.
> > 
> > Signed-off-by: Justin Suess <utilityemal77@gmail.com>
> > ---
> >  .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml        | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> > index 42dfe22ad5f1..06656058ce91 100644
> > --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> > +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> > @@ -19,6 +19,7 @@ properties:
> >        - const: allwinner,sun4i-a10-ir
> >        - const: allwinner,sun5i-a13-ir
> >        - const: allwinner,sun6i-a31-ir
> > +      - const: allwinner,sun55i-a523-ir
> 
> I assume you are adding it in expected order that Allwinner is
> following, not just randomly at the end of any list.
>
I did it in product generation order, is that what is expected?
I know that the a523 series succeeded a31, so that's what I put for
ordering.
> Also, please change all above entries to one enum, can be the same
> commit.
> 
No problem, I'll do that for v2.  
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
>
