Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECD249E5FE
	for <linux-sunxi@lists.linux.dev>; Wed, 30 Sep 2026 10:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765278; cv=pass; b=BY/mj/rdOyB34TB4h4xSXqVvLwWbT5ruZ+sygC0kMWvlvGZtevdndUOl+3qghhHTOFgTxkh48baoNhUQdHi95DS0PPG37Sj5oKumgJoHILdFD9bWhAyJ1qG5XndNea8l2xYPk9IRuLtZvGSxWTRCsTPIwjcm0Oqnk+02Fnze72U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765278; c=relaxed/simple;
	bh=BJbbh5rIl1dEuHCd/t+PuKNfcL4FcSDDMLm4FZ7TkbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5eefoDY1Essrhn+wsXJY8E31FeHhL6Y4Vg34au2QcTuDBpvgeVf3IMkXps9eqgTtB3u6GFbH2IU65hLGbr0H2nemVgl4r5J1i6NUFowKEEVjmw5Hwud4gcvKVUm+M5z9C1Z3KZgZirhKlsHBYANMGKjAF6OkTQQhPOyDuJQY/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7jAfo14; arc=pass smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7jAfo14"
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-8873070bcd0so158188b3a.0
        for <linux-sunxi@lists.linux.dev>; Wed, 30 Sep 2026 03:47:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790765268; cv=none;
        d=google.com; s=arc-20260327;
        b=cE9QvydBXaz6E+O2ZuNKExqW7bMBy+E+W/t24wxDSMyAMBU9viGTDNKMvVk4WDPpKi
         J8/AkgIIwuwWV/ZRGPweuKo+Wz9KafinZDr5Y98vtwkS6IlZUGmcFyJuNpyKXnsLMj0H
         BvCKdtTS+BkMiH3A8KairoYZfDQIdtLoMU5Gx43t+abjZvibLPY9Qjx2Kz4DeyHS91f7
         0i96HPv4IyrGepApvjVvR6nICi174du24Zrg+PNZwqsYr6ezAeCON8QbU7REQzA2j+tz
         CH/MdVPMdmpjsW9/XPjIevOD/QdfDO4tBIYMybYHu9+b+/0BKiffrxrO0mjDzqCIOPkK
         b5xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=frNDlYzQ/8uu7EJKdkeWFduTnVj3NcJs9Yyw7Sysjok=;
        fh=kPT+PLKxFavMmxIqQ9ZfXtI+8zYnKDYcZeyFPRu1CvQ=;
        b=i6mUO7uNcRVnfqlgxjqwragkvMNwhJvAHRup6WmYi9Xy4ddM2F36gmMY5i0uwxqZdV
         NpY/ovormOQj5KAZCEmvhTj+8MvpsU7sKO2VfxE/9EQSbt08rq6dH/m1cajEP62CWtwp
         oRcf05z5AwntjSDYeLmNd770yd+xbXQCgGwEMQSR+4BIQnDs5dnqVVsfRBkCU9Y80vHC
         t6vNgYnVgS9waKJtJTiMfOAMtLFBwhWOv+S2/XQtTp6M3zBBe5D7kQp9rzdtvIgwbcxS
         eM5rETBcM0bvlonLMMg5pNBVZjqTjojtzJr0OljHCZ408j2nODCc4HBds+lpSqNxru5k
         DsQA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790765268; x=1791370068; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=frNDlYzQ/8uu7EJKdkeWFduTnVj3NcJs9Yyw7Sysjok=;
        b=g7jAfo147t7tbmv3kaXnbFfLiqqjfjgXKBrUYTQYTakeilKyUq9DMDk2Cs6aX08ug/
         8h/iygguhIjjacQDoOiUgiTYe9VrQR1yKBhIlqj8qfOQcddZWk/0zck2FagyH/aUHffg
         /nDCZJbRhfPwPxzVNFaH7iSt58C2yahD81nxU4IbjEJ2tV0//lI6dw5T7Ghzjx5ZjG2d
         e1NXnHPcDeyIevpzXgbaq3OpDe/30L/fKq3sJUjXWWIsB/fbH8kqKyYmJaxj8P6Gg5H6
         MlJoeZO6U0Sgcbndhk8KIDfVov73bzxkFtJCVKmIRph3ZgDJwJIgbwx4vBm8db4Zi3lZ
         6yag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765268; x=1791370068;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=frNDlYzQ/8uu7EJKdkeWFduTnVj3NcJs9Yyw7Sysjok=;
        b=hFFXnCX9HbNql/8DGRgAHiPhZE3SpuFq2ExRHt8cS70VX87y0JzdCgUsNJ8Os1TiIU
         zC0n5VOs6x31z0ZCGsSO36qhLIVToXDjh5/xMN9aFpkcSSq9MeBxS3Iq88+2RfFSCXw2
         bG5gGe6nX86o4hpVxNvG+ugTTOx4N8WHyo8fYp9hBGD/m2VgpLxCPD+NFcJZ5787AFFc
         MhUQco5Pq7iK61dCxvGzG3ZW8TqnYaA/Afsr1wz0I6H+zeNx18BZdWkGgIfAk/gEgszd
         dnzXzpHRFC67HFYhskDsgcQKUSBt8zvrfzXs+aeYD1v3xPaCQ/XvCMpNkAMTTA+etnT9
         e4ag==
X-Forwarded-Encrypted: i=1; AKwUvBwHrBBS/6QcbvgdmLP6Z7C+Sza1dg+UkoVa2CSb3lWbN1WZ81a47eTkLOaMMITcOgfOyoGW8e7AdlHM/w==@lists.linux.dev
X-Gm-Message-State: AFuF++myhpCJCEj4wb1/3mEQQW3vuR0Pb9Xfg3uyx8jTO7bOG9A2z7ZB
	a8YB1Dhe5rxNQuTaQyp8ZUhgcCCGhvD4hC6BRcfXn86Pn/x+qtozBvHAig8J/x28daTw7KdaX/j
	gGYzrLf9Px20MglOPNDm1GfyLZr5cjfo=
X-Gm-Gg: AYBFou16/7taHreJKA7uWx54Pdk6ddFdOZyrMlnb3VsD+mhnUkjiv+RAD5Nxh5TA1PW
	PMRzqyHSFbUqV2id5u5cDSZKEH/S9X24OlrjRNHPNCVHM66rHQaRkgwACHz8i5WLDKkDRt9Dw8N
	d7M2HeZlQVenZiJik3zTfk1Yg88GHoZxQuJ6V+gSWEvpiPzSDXLs+DBI61EM7vYSwvMsJOERGTZ
	dIYKh+4Ov1kWH/NcwkMTonq5e01mBf4oVhZraEMGodj+vcLKggbiP+Q6f1d2UpU4Z88VePAdcmb
	wN+KF5KUTdHMndiNUoi/MvXKlYOCUThaXMPB1X2jX889ysFzs11pMkci9Cym11PRqj2Wm08=
X-Received: by 2002:a05:6a00:6c8d:b0:880:3b31:a4bb with SMTP id
 d2e1a72fcca58-8874a89ae36mr654876b3a.20.1790765268145; Wed, 30 Sep 2026
 03:47:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260927151016.186493-1-pmazzini@gmail.com> <20260927151016.186493-6-pmazzini@gmail.com>
 <20260930-camouflaged-koel-of-resistance-7b09f5@quoll>
In-Reply-To: <20260930-camouflaged-koel-of-resistance-7b09f5@quoll>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Wed, 30 Sep 2026 11:47:05 +0100
X-Gm-Features: AclHuK8o0ZcgRpk54PvKUPvKEFYR13nUvSknbUcihyLHytfHbaM-Aa-FPmvKY64
Message-ID: <CAAxh=jsr1M-RHfqPF-hgQnM+RmH_D82=YX==Vn5-r2=1AB9eMA@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thanks, will fix in v3.

Regards,
Pablo



On Wed, Sep 30, 2026 at 11:10=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Sun, Sep 27, 2026 at 04:10:10PM +0100, Pablo Mazzini wrote:
> > The B288 RTC wires one alarm interrupt, not two.
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml        | 2 ++
> >  1 file changed, 2 insertions(+)
> >
>
> Seems like valid and unaddressed comment from Sashiko, so dropping from
> DT Patchwork.
>
> Best regards,
> Krzysztof
>
