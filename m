Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A33E3FB7C2
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 12:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779106180; cv=none; b=h0tLaQlMYqT0Nz6MaokCmh2JpsoMrysC+cUwxoHAyva7pWk3CNVguzJM0E79Yq+tj3FJZm+6HQxEdcYgsxKCzE/74R7wQkvgJZcvTaFnz/ZQBAaMJhXpdbJ92egZ3V4PPiFeYifPYqm1ouPaY3Nqwnua8HNJEnCfR0CnylEXxy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779106180; c=relaxed/simple;
	bh=7AT2/oSiJdqVT/zn70Y/W9nkm60nW+UXqpoRWb5gyUI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IuriKPOoOaOtV8f4RM665/aPpldC3kpObG4MCX/vZ79L+BBlUQ2br96Pb7ledvuGbdVwNQw0nCXDX+UqcI2lJc9QgLwF4pSPzq2Sp9+SxHgvOlFl5UkWO+OwXIO6jBiFeArwHtq7HdSj8v/UyIVCqZYUbARM+nJql1AktGGz4Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pMW+jCWb; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pMW+jCWb"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48896199cbaso17181545e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 05:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779106175; x=1779710975; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7AT2/oSiJdqVT/zn70Y/W9nkm60nW+UXqpoRWb5gyUI=;
        b=pMW+jCWbT+JMcD8hanhG51tJqS/Hw5+CzdsQxRXS+9SKpk6vU9PPdOoRBzHPqN3Ujq
         UVPL1oZflejZ5UMqXgz/JXSQ3JEPRFVKTVhrHKK3XGteOdIP4OEmi2YD7tzJARi8XVJ0
         Bh7Y/KJdO2jixPbVmHXtVj2SoWgUfz/jgNZim1/OURUchYse8QeNbxJPxn/GrZFZjqLg
         dSLCeZGyX21z9YxsxXZ6U9+1VTh0BKAj6aMhxvwCOXrknpTlRd/w/6DKaY0Chv6O2EdZ
         SFYprkTvU+ORUSsOuQukF2akWZD12GVqQSTCjs4uUxDQFtQ12WgFA7oZqGhCFMV0NjJY
         xPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779106175; x=1779710975;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7AT2/oSiJdqVT/zn70Y/W9nkm60nW+UXqpoRWb5gyUI=;
        b=HVKNbuRBOs3KJ/yumND5DFFfZzaNYHHYXLF5vMkoDdkj9qLSQyLywBnXVVMpfmjY4Y
         cWKOKw/oOCRGqVKhUrgWtbdSLaGChZ5AYUO+P2+XOMJ5auKp4Uh3e/7JALRpf9DM9F4F
         91sV0YlBiH30EbEumzxzU+8vFBVyM9sFf7zKecGY6jWVILXDX0BdBeh1H5jrogAKnQWF
         spaCGFiN2QiCvhJDItsVwLAvi6jeeIp5LGJjAuPD50+MnVadWTo7Wpn0zRbEFhprqI7m
         8UOu2MGqEAU57r02J6Ff2BY02ws1F6pPrgpbvBQh7//Y2cTucuCuJzEq/tYbl5ue1Zd9
         /Tdw==
X-Gm-Message-State: AOJu0Yx/tNBJqB5ImlxXUeeUOS1cfAj2PNrCbvApXue1mh+9AoKNPhzp
	VqXuAV94rSh4RfbFumYeVJZV+otuxkGHQh/heuX5iZ8FpfV0/XL5hoPS
X-Gm-Gg: Acq92OEJOAbMvl7PbTIX1VPhDm0IfLCQSyoe967rXFdKcPgNyGoWVkcxmjDr1Tz49ZU
	aypf9MPsmxwJgJuQdRCNLBS6ukGExI8xXwiED8vDiCAsijETFXJsIPIfaR7wCLq89LE/3q9bUH3
	h42ZMahEw+SxvK7lrEhFe2cSW2g+jLim5l7pxIuOmT8kpG5TpL5FF6sb6kn8EO0NzUsjKJry1Nz
	e0+BAHnd9lNGVJUCF2BewkCT3cFMKV6q6XQY1tg/BU0/qBJtUEQOdYf+S04Z5tli+PFe33zpPNg
	WMNPcjuBSTV0J3yeWZ0mMQNqgDex0tCOqZ8PIF2H+MLE/q7wYHZC9HZ2G1RfiE+WahE5/0hDM1M
	VSD0tTtv2GB/FHEs2f32ALmfNQf68o0LEkZvgdOt9suWxMZNmQCxq5sn+VMZk37qo9kpKJLEiBz
	zt74JrCbNRFfpIJrD7q3BNEJT08GnXlK33r+QI/hIq7n6cL9od/ux9d17ClEfYu+mMxhLk6OqqH
	1hap1yym/SXfw==
X-Received: by 2002:a05:600c:a293:b0:48f:e6de:1cc6 with SMTP id 5b1f17b1804b1-48fe6de1e03mr141000945e9.32.1779106175444;
        Mon, 18 May 2026 05:09:35 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49017d7108fsm2250215e9.23.2026.05.18.05.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:09:34 -0700 (PDT)
Message-ID: <579c7c33123c4cd0bd486301e56daf5962ca55ec.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 14:09:33 +0200
In-Reply-To: <agr9m_tidBr6Cu2h@collins>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <agr9m_tidBr6Cu2h@collins>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Paul,

On Mon, 2026-05-18 at 13:52 +0200, Paul Kocialkowski wrote:
> Just in case you missed it, there was a previous submission for this
> board which wasn't followed up on.
>=20
> I also have one of this board and wanted to respin support, but it looks
> like you beat me to it :)

thanks for the hint!
Do you mean this series:
https://lore.kernel.org/all/20241227-a133-display-support-v1-0-13b52f71fb14=
@linumiz.com/
?

I've missed it indeed! I'll look into it!

--=20
Alexander Sverdlin.
