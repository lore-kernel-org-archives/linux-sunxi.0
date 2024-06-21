Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68AD2135A
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Jun 2024 14:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718980660; cv=none; b=oWbk47ucACWYOl/xFRagoxDF5fkvaPKHPQ1Vf357WAZ464mUr2s5rtkAkJXs/0GXrST5t8gMTXTcTFE9nZ/G+ahwsZNYjv16T7JueT6Tv2RjJo7epkRM3IUHS1gz4gIy/NwzfsH6FVOw6VmpTsWdO0tdo6EPXioTajWbNtTV53w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718980660; c=relaxed/simple;
	bh=ejMsu1bb2eGEnL9goJV3n78NDDkQX2G7CVwsyRVBo4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S/1ZWw34ikFPVWcOn622OP0GlDYkBPTwWqGZ4WPxua5TL1vipzKigdmiywH1lhlfn3ft58uMvH/jiTru5Rws87JOhPlJ5VL2fElyUp4bQAe2Cw9fyoS7enD+uSv8lPD4fNTy00jJJ0YuaWqoFxYSXSfrpQzVa3LPvuYM/aJDjIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52c82101407so3607617e87.3
        for <linux-sunxi@lists.linux.dev>; Fri, 21 Jun 2024 07:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718980655; x=1719585455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ejMsu1bb2eGEnL9goJV3n78NDDkQX2G7CVwsyRVBo4k=;
        b=Ef4aeBM3lMh0njrS+ndG4Rke/l16TsiAy57tfBJmbB1yAXXlPjxtR2Y97UZsBWDL10
         Xgd2UQAnQ1qJyCWGy1tOAfFdZq4rOr2Pv1DHbe+K6yWdFw5AhW8BeY7nG4XX07aVBTtu
         96pXLpJeJ+6THSFbK/iHdH//gbcBOaDtgbrL7C2vYea9KeMLd4dT37EduuqeKFfu4zmS
         TWuyJS2/C2VVT1HahalGzOIF00NasmezqrM9H+spYMBWfU3N0lDeD3ugvP68xm1KNgYj
         GulZKnm/hEnCvsiY7rSMJCJ9PkZMpiap0YAmAVeLh+8NdicemDHig727rwOGZwyECDis
         sXeA==
X-Forwarded-Encrypted: i=1; AJvYcCV/QtMpz0B+l+WRlu8D9Vs/dwPTneAuyrHDmz9Fv7dvCmS0cmQ4i1QtJ8jfzbWDw0eC+gEJIKub311xEwEhMUUFcvDYnlDxeRVSaNw=
X-Gm-Message-State: AOJu0YzSh+n48OVGAJEK+ae6Fwq0IxKGzJu+FSVlxYVX7p4fnPkfCaVm
	qdfkH+lezI7lIQ8mPQrm+7JHE0va8nqKV/yrIKAqdQOF0wt8l3t/z9+vxPlk
X-Google-Smtp-Source: AGHT+IGyiIcyJgpW4SapRKEmG6pzq+4qbEQrf+fEuphN5FCBb6ikLgibBv6b7Ud+p1eRpCPXrzfJPw==
X-Received: by 2002:ac2:5e37:0:b0:52b:bf92:bcd with SMTP id 2adb3069b0e04-52ccaa328efmr5778827e87.22.1718980654446;
        Fri, 21 Jun 2024 07:37:34 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd64496eesm216453e87.253.2024.06.21.07.37.34
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 07:37:34 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ec17eb4493so29680221fa.2
        for <linux-sunxi@lists.linux.dev>; Fri, 21 Jun 2024 07:37:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXbQGQMKcKmD9fF0ph2tdZmY9wwxgIs8azxlyc2+AiTHtnT13hatW8/7CuluJInb5yMshSDV2Mls77inwkFyjX1peCZyoATX6FHtAQ=
X-Received: by 2002:a05:651c:1a0b:b0:2ec:4093:ec7 with SMTP id
 38308e7fff4ca-2ec40931047mr73651401fa.30.1718980654160; Fri, 21 Jun 2024
 07:37:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240616220719.26641-1-andre.przywara@arm.com> <20240616220719.26641-2-andre.przywara@arm.com>
In-Reply-To: <20240616220719.26641-2-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 21 Jun 2024 22:37:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v66t88ER-D71hrJ6pqybjHiYrHE8gnHHxpX11sa5H_F7bA@mail.gmail.com>
Message-ID: <CAGb2v66t88ER-D71hrJ6pqybjHiYrHE8gnHHxpX11sa5H_F7bA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: crypto: sun8i-ce: Add compatible for H616
To: Andre Przywara <andre.przywara@arm.com>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 6:08=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The Allwinner H616 has a crypto engine very similar to the one in the
> H6, although all addresses in the DMA descriptors are shifted by 2 bits,
> to accommodate for the larger physical address space. That makes it
> incompatible to the H6 variant, and thus requires a new compatible
> string. Clock wise it relies on the internal oscillator for the TRNG,
> so needs all four possible clocks specified.
>
> Add the compatible string to the list of recognised names, and add the
> H616 to list of devices requiring all four clocks.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
