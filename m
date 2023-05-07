Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA87B3D67
	for <linux-sunxi@lists.linux.dev>; Sun,  7 May 2023 15:09:59 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-50bc570b4a3so6953549a12.1
        for <linux-sunxi@lists.linux.dev>; Sun, 07 May 2023 08:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683472198; x=1686064198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6k7of+oD7aUsR3ZuT5Ha6yGbmcWNRVYGMihlsEz0Xhg=;
        b=cN8WCKzL3z0UDeYh32zhcfq6BPnbBq/473XGNaamAepsq0ySGTjyRZYn8xTBDG2mrx
         QYm9QwRYg8Z85CR6gGPTGK4GULfL8f+pKD68yRYQdXIAGUV3LBBHTnfMYJ8nYBT4jzVU
         Kn9p81vKiVi6kP10iYxs+NageUXik6ESyKb5ARp1JRLGmPNGA49Sd+KTCRZvAdso4I/f
         mKl6RD5w6Af+0s1ur//68pdNLm94Ol78n13MZ6N1Get+dRZGYcgDpqnGSWYnldDkRTnh
         fZkeXR5FGvujWH1pM8KZkj3kxKQWmSeIJMIfQgHkiDteGeqvZO31cZlUcdMTWKnGAx+i
         F5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683472198; x=1686064198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6k7of+oD7aUsR3ZuT5Ha6yGbmcWNRVYGMihlsEz0Xhg=;
        b=HV8FzVzhT7DBui36e50uAPDKgIveHxRITG0Xr51N6GYRNzQorKvZN2RBJVhPHgCksC
         Kf9keIjxGeNHHbGXknCJ7D2BcGoDnZYxu6oWI++U8LCM+BkackUXr04ztZtLSwCquaB+
         As48LKd8WcpPuWNr4zEo6E+TE3tSSG2GCzX1SEV2bWCUJSBAA5KEYc6z8E/R3MZ/fuEU
         LgyLwukfXuCeLCftS67VH93wdjQRQW6F4NX95E5unUXX21/F43QUPpmRAPn34ZU1fT1Y
         yDnSjWAjT0KbWH7/KuahAZrotB3d2a0EnmNyEnHVJROxsgTDdmWHUgGF2xw/6KM7EIkh
         wd2g==
X-Gm-Message-State: AC+VfDwP79lwaRlIlTLsnpeDZ7f8NsBY+uVAD6NKzg9MCVKCX0IvgIZj
	gBHmnbJ4wnTE3h5bSawi76Hou7tIaEBt1axIx0I=
X-Google-Smtp-Source: ACHHUZ6+VFC93AW7h4sZdYiyaPqZUGGXGfe8vKSCHC7hQOOltYg0zJcH53vc/h7kUSkTyJjHMOz1gnBQknP7XOjm+v4=
X-Received: by 2002:a17:906:7955:b0:94f:9f76:c74f with SMTP id
 l21-20020a170906795500b0094f9f76c74fmr7323137ejo.52.1683472197958; Sun, 07
 May 2023 08:09:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230506232616.1792109-1-bigunclemax@gmail.com>
 <20230506232616.1792109-4-bigunclemax@gmail.com> <20230507105150.31643b87@slackpad.lan>
In-Reply-To: <20230507105150.31643b87@slackpad.lan>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sun, 7 May 2023 18:09:45 +0300
Message-ID: <CALHCpMgxsLzRF0FfazMXYiWK1fV99dbxYNDvoj+a0S-RvZP9Hg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] spi: sun6i: add quirk for in-controller clock divider
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Maxime Ripard <mripard@kernel.org>, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> This case assumes that the SDM bit is zero already. I think just
> masking both bits off above, right after the read, is the easiest, then
> you can also lose the else branch below entirely.

Thanks for this remark. I fixed it in the next revision.
