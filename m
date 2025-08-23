Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7644320C461
	for <linux-sunxi@lists.linux.dev>; Sat, 23 Aug 2025 23:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755990582; cv=none; b=VjA7qFBi1qwZca+UWbRnrusr1wB+Xp7TBqt7Nf3k68voqIfKdqtlHdmr5gB4fYIkuL3Rv/tHoWP/yalVnR61eIyOaiG/qvlZZYRbtWwJhQo9aqDR6fXsVD7gNcE9j5unEVI4snp82AJFjbSpo9XhSiQOjM4O3ZAPNec8PAl9DwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755990582; c=relaxed/simple;
	bh=p2pU3fFxLFScSmj2hUqBJ8RqBm9xy2DQkrm9ol/p+Ro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SryaBUCxayWZZPy1Bh7cq25doVCC4/Y82wEnhtIUDALmZTTVpJPQXKbUHoqFdUkXwkw+VeNOft7dSSHoUrqEG8cyi25GcN4FEm33xl1r3ugaBg0ZWSCoweSCLIk1HMpbvNjOkspJ7oaOnHVr3+ab8HX6ODksSx05Wg8OEoDcH+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCXtl0Qc; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCXtl0Qc"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4b297962b24so32014561cf.2
        for <linux-sunxi@lists.linux.dev>; Sat, 23 Aug 2025 16:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755990578; x=1756595378; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2pU3fFxLFScSmj2hUqBJ8RqBm9xy2DQkrm9ol/p+Ro=;
        b=ZCXtl0QcWAUdQS7UqU4Ba8VjTZhqUAjdEVrQW8cuskJnhufZQIl/KSfwa0bvTLSASc
         2aaljZ+NvtF6guGDII2Pra7/nv/EnjR3lfAEVEm3/w+H5d5GkySv+1xuelhZw2VqhlrK
         rXD4hAT68IQdSwfwveNSSxQecGkPJWZSX1AIUdzSkLQF2ZWC4HzSWdY/Uv+r2JiW4v5h
         H+wlOS3TvrXVLnKW0UYqDU+67R+SP6fbbl/y61JP+lbOXtsScKsCm7TMSZ0ftzcDlC1z
         /u0Xq04jXHwbVKecOZmtmNuB86JcTKhX0Moud6M/47uT2FDENpA8cUYOtxYDjhghmmGb
         XVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755990578; x=1756595378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2pU3fFxLFScSmj2hUqBJ8RqBm9xy2DQkrm9ol/p+Ro=;
        b=qo9Jpdnzg4Uk40Agtyamj70kF52vLCXDOvH12EavIBy7qD9H3MS3i8czxrz5a6JWR7
         mVAUMjO7wwDbslKKYRGxMA4JJowFiHCz7w3iCly3XmYAM6r5bC387h3DMHrKxVi4Z8xT
         F4f8NO96Fezqyi704LVgRXBb03pzZtyHPB0JMNgKGXyetXoX37nkdxNGzwJ1vW1CwDHi
         5nkS18CKOAUubIl+x4g3mKv9XHxNX8x7pBa3ZzU3PTHibgzVNcuS5n+XIDcR9tcjdeYE
         GTmIOU4mJGhwQ5IwMgIA86vLbeVdjWVkkb9p7Nz2bTUmdF0TACig9auovyHlJt+9+xHX
         3z+g==
X-Forwarded-Encrypted: i=1; AJvYcCXFDEs1FLkfIB5lj2oK18Nl4oAfantdk36cBZpne5qO9JlGUsdVS4uctlWLr/Oy8j6WQtHcc0XefKJuTw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6kkEpAPRbkQ0JzmuhziNwty4+jmv8HnGShlNj1UfrjJms39BP
	s5VYwsaljse5DcwTfOfxCFlaVj5LxmWabel7nOzIkXidQjyKolfnUZifBWcs4kxhe2s56zCOv+m
	8LrzUdsMdae+cupaSxfYu7aw2xUe6qF8=
X-Gm-Gg: ASbGncunK5HBOHlaQTcghNLr4Toe+EviEQkS2RkeIi7G+jOCJBTk01TCaWHW3VbkZUd
	J9b/3kCOn2JobdOPUxdBgzjjHBp3tklXJ3LIVNud1Bmnqyg4N2tl9si1kmsoIu0h86CEr0kLCBz
	wUamlXXfFypIVqLTtGLEVZi2ssE0kymz6iocKi23FzW/lI7REy5CeAxLp0zVCwxaa81ShYiInwo
	Y+Y7Kg=
X-Google-Smtp-Source: AGHT+IEkAzV8H+clwN6tL7gqmSvk56dPwvIVT4gQVPsLgXNkLSqtTBC6lbcVlarR1iUNCNSl5l1xmo1oxjBxcJoE0Ac=
X-Received: by 2002:a05:622a:1449:b0:4b2:8ac4:ef76 with SMTP id
 d75a77b69052e-4b2aab27f7fmr97527041cf.69.1755990578167; Sat, 23 Aug 2025
 16:09:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250821004232.8134-1-andre.przywara@arm.com> <20250821004232.8134-9-andre.przywara@arm.com>
In-Reply-To: <20250821004232.8134-9-andre.przywara@arm.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Sun, 24 Aug 2025 09:09:24 +1000
X-Gm-Features: Ac12FXwXg3BBSbryJoDW3xmfP_LFIAOgrCsFqUWYjsCuW9pa0DyK6tp1OMBe8g0
Message-ID: <CAGRGNgXsG5FmwFTSE1BM5qDHz_Jovb4EuRtt-=ipavBDf7AzJQ@mail.gmail.com>
Subject: Re: [RFC PATCH 8/9] pinctrl: sunxi: a523-r: add a733-r compatible string
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

On Thu, Aug 21, 2025 at 10:46=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> The secondary Allwinner A733 pincontroller ("-r") is interestingly not
> using the same new MMIO frame layout as the main controller, but is in
> fact very similar to the A523-r one: it has two banks, with 14 and 6 pins
> each. From the driver's perspective, this is all we care about, so we can
> re-use the a523-r pinctrl driver for the a733-r, too.
>
> The individual pinmux settings are different, so we must not use the
> a523-r compatible string as a fallback, but we can surely let the same
> driver care for both the a523-r and a733-r IP, as the pinmux values will
> be provided by the DT.

If the bank and pin counts are the same and the pinmux values are
provided by the DT, that means they _are_ compatible, right?

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
