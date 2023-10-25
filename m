Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E24EC8EA
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Oct 2023 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DRwqQmhT"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-7b6d6773d05so2092441241.2
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Oct 2023 07:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1698245531; x=1698850331; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLjdKZ5k0mXVbD8bW7euvhzE58el0xEiaStx/smEM9o=;
        b=DRwqQmhT6onn+dWqzTwEN8qywi3v+g8i1G/7bg5wIUQorsTxOLUSIzNEYzNgbx8fgi
         fXimHdk5G+Ch1IVkM/GnhlPQu3v3vYceHV5cZCTVBOBAACOoRnatikLOmx+b35cCAP66
         NRAriVQY1Y+f1UAIZZJ0UDFycOVauu1YJgM+tTIdWKo+cw1kabMZBzreyhXXt8sdR+Qt
         44D/vJem2PQgYadEaXJyXEjhiXq6QIk2vZixwDOiJrdEWGC+G6YVpNpZ62+4KgjZvcLJ
         6fBlYUYjbMAV9Jtb3WnwpBPCddMXkHlOQeMgzKiS1XWD3PpNO7e6Hlr7VfjDlXRFcu+3
         1aZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698245531; x=1698850331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLjdKZ5k0mXVbD8bW7euvhzE58el0xEiaStx/smEM9o=;
        b=GcHQQqadUzrY9EWM9KN3J3q88ndAeoBSip9jiHMiq/pD7hAKb//zkjQnBBpl49Ixd1
         q8EgWZT0hRMtKATmPaHX4rg7YEjL7gJW4rSEo+t9N9QgXeLFCyfJgYwvJuRdpOOVl0s8
         ZsFUtq/nnsiMPtsBa0ajwMzK0jR+Oi+m5Qumc07begsfGDOlq3vrG2dZ8A5omPVT+9co
         Mz2bBbY2TJ58qnjR0T9KxE/OlVjHykJFzCuNxV4cmydJ4cJN4htV+15KeeXGWZFf4AJv
         KdBeBCjY/BheK0Q21WXCqCGgiT6Cbbp7ZB2hyx9+SR+e7lT28lOI/4jV1bc2bhF7nAaT
         QPdA==
X-Gm-Message-State: AOJu0YwS7fWPVNs5ky1xitYNcUwHUYte+bRPoPzx2W6ZpXNuQYflBcQK
	xSoqxjEuoKDqC6sq6HE6yLXL65bv4pf2SOK9i8dcgg==
X-Google-Smtp-Source: AGHT+IH9eZcIeh5TypMu2DrELpqy3iFXVc5K2Hl5mUVraJmb0uVk6Ut6VGVvmn/692Isw5J2GiM90b5hEhQWssWFL90=
X-Received: by 2002:a67:c295:0:b0:458:47e6:70e4 with SMTP id
 k21-20020a67c295000000b0045847e670e4mr15925625vsj.19.1698245531279; Wed, 25
 Oct 2023 07:52:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231024171253.19976-1-zajec5@gmail.com> <20231024171253.19976-2-zajec5@gmail.com>
In-Reply-To: <20231024171253.19976-2-zajec5@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Oct 2023 16:52:00 +0200
Message-ID: <CAMRc=Mdb7mjOLQSVVka4XTCuziB1DNj9kpgB=sE=fcJKvpk0_A@mail.gmail.com>
Subject: Re: [PATCH 6.7 fix 2/2] dt-bindings: eeprom: at24: allow NVMEM cells
 based on old syntax
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2023 at 7:13=E2=80=AFPM Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:
>
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> This binding supported NVMEM cells as subnodes and that syntax is used
> by few in-kenel DTS files. Modify binding to allow it.
>
> Reported-by: Rob Herring <robh@kernel.org>
> Fixes: c5330723d5a0 ("dt-bindings: nvmem: move deprecated cells binding t=
o its own file")
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documen=
tation/devicetree/bindings/eeprom/at24.yaml
> index 6385b05a1e62..b6864d0ee81e 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -12,6 +12,7 @@ maintainers:
>
>  allOf:
>    - $ref: /schemas/nvmem/nvmem.yaml
> +  - $ref: /schemas/nvmem/nvmem-deprecated-cells.yaml
>
>  select:
>    properties:
> --
> 2.35.3
>

Do you want it to go through the at24 and subsequently i2c tree?

Otherwise if someone else will pick it up:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
