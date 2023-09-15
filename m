Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05DA10954
	for <linux-sunxi@lists.linux.dev>; Fri, 15 Sep 2023 13:14:46 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c3f97f2239so18266475ad.0
        for <linux-sunxi@lists.linux.dev>; Fri, 15 Sep 2023 06:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694783686; x=1695388486; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeXQAgEvCG5lWU7YEjnooq5zm07TURELH4onh5xtUHg=;
        b=JE6Ngh2GVJjn4kteJbUcqqHtCWTAx1eRuenMDoCYCFgWAozWwL2fXI9PTB7u8I+qjx
         K2KEuKDVvojq1JOAMXwjSesiYRtHIkH8OMN5kCT/Sm2awVYUS6SEDsVAKw7VxXUyVq9A
         hAZN101OaOOoa/gnirONz+YKDtXmZmH/q8+fyn+hiCymD19vmSwmpWsP2/XR6Un2S1iL
         RSGzelcni6a9+JGIXGnAVFD5yd/D2fxgWBnUUxUhbLOUjShkq/j6Jttz/FB7Ylqe8eOh
         xaXzbUb2acgPnc+ztRI5HSGIdg8MkcLAJm23ZH5j7fQY5/StYKN4ePrxvSN0rHpV7vkl
         /wSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694783686; x=1695388486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YeXQAgEvCG5lWU7YEjnooq5zm07TURELH4onh5xtUHg=;
        b=bbtcE6tIv1UXzm0z3zVe+iYgyz7YvLmwiPMz9QBXllqhFkIb57/CUWOg7bwoByWGLc
         jKewrNKZvWjzRudYeUgB7pH+GNexdxXW7gqxeIBWwIRrBVQiqwGER+v7E1fTYdWjOyJz
         k31PD/KI9qyFrQH5oZSm2o6LDn0DFI1j5Kdn0ux9O8c3aLDNUDwokrUVZg2+sOjIBJmp
         LCvC08p1xofElvKoU4oHksYKpQ7aPg5bFaLZg+IYavRZds1864/sACnu7ERfw/4PSc3F
         Bkh/BSQXjWr+kJJknSmU0h/4Rb5UgiDwlGWmdl9ZYDGcokw3UlyzHIZJXaUuy60FmxJx
         vtUQ==
X-Gm-Message-State: AOJu0Yxq6T4tV0z7Fgkmc0rPIMoL/offKqcBM4fbyhp3ZOdZmYUXZexL
	D4OM0f5f0w3+sF/QTCrMFoxEfkONOlPT1jhxuJM=
X-Google-Smtp-Source: AGHT+IGwQdOfBBcGiIToYcNqwva/3tvlNZxrGwwaqB/mVbsMDwp6XECrBHtfCJ1OyOlS/idai/gsl5ynbq923kvw+3Y=
X-Received: by 2002:a17:90b:88f:b0:271:9e59:df28 with SMTP id
 bj15-20020a17090b088f00b002719e59df28mr1287536pjb.29.1694783686026; Fri, 15
 Sep 2023 06:14:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230911140959.2046340-1-longqi90@gmail.com> <f4f0ed21-1e3b-a7c5-79f8-3469c4cfc471@linaro.org>
In-Reply-To: <f4f0ed21-1e3b-a7c5-79f8-3469c4cfc471@linaro.org>
From: Zhang LongQi <longqi90@gmail.com>
Date: Fri, 15 Sep 2023 21:14:34 +0800
Message-ID: <CAC0WRTWr66kUnaTvdJXWP=hw1MmXB=5R+zqn0OgOqNqGr==BdQ@mail.gmail.com>
Subject: Re: [PATCH] fixes the pin settings of two LEDs on board nanopi neo plus2
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Krzysztof, I will modify and submit.

sorry for the previous email which is the html format.


On Mon, Sep 11, 2023 at 10:42=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/09/2023 16:09, longqi wrote:
> > Signed-off-by: longqi <longqi90@gmail.com>
>
> Thank you for your patch. There is something to discuss/improve.
>
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching.
>
> Your commit msg is missing. Please describe the bug or the problem thus
> it will be obvious why this change is needed.
>
>
> Best regards,
> Krzysztof
>
