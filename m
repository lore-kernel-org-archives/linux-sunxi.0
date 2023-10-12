Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3570537B
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Oct 2023 02:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-57bb0f5d00aso322613eaf.1
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Oct 2023 19:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697079195; x=1697683995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o63NRkqQgQp5HjyonmkoKn7I3h3Gg+fPv/gJKTSgwVQ=;
        b=oVNvuBtabD6Zq9zJAsqwvrlOz/po1Tvt1TgydyvVkizjdS9j0thdNM1NgLtFBVTKhf
         4rLzypeNALzONDsQ7yJbBwJZWqgOhg4sZLc7TJxA8+nb8xxmePldvrQLj6AgdhJon+0U
         wIFuqoKv5QX0PF5g5P0j/J1lvASlTRSPjvhMR5M0tauIF9YLybKhn+x/iCHuaPu2G01K
         Pz2WOAIv/pw834dI2pFbaz88mNvmSdoNDo7WDCOvgdsAp/rv7YTQdkCT+RE0dL0NhTY3
         NHUoO5emB9Rs4b1hz53Xjwlk2NAMQHs3SH/YcDe0IDAvTrzk/8b27gZ2Mc6oeSAmAl64
         dE8A==
X-Gm-Message-State: AOJu0YxShYOfZ+e8gP0wFfy8CEbrbD7brnk/TzCOhMmCPalbw9tneyPc
	JgYDyW+5hnSLg0kGVbQUT6oSvEnIdmFM9Q==
X-Google-Smtp-Source: AGHT+IHXict5BmyMjT273sTfEiSP2P4aEjZDFWfI6RKO0VdcghtCvSC6WHsr95j5zAJF8me76BMrUg==
X-Received: by 2002:a05:6358:52c5:b0:135:85ec:a080 with SMTP id z5-20020a05635852c500b0013585eca080mr27769701rwz.32.1697079194991;
        Wed, 11 Oct 2023 19:53:14 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id e18-20020aa78c52000000b00686b649cdd0sm10787323pfd.86.2023.10.11.19.53.13
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 19:53:14 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-27cefb5ae1fso322802a91.3
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Oct 2023 19:53:13 -0700 (PDT)
X-Received: by 2002:a17:90b:ed7:b0:268:7ec:51ae with SMTP id
 gz23-20020a17090b0ed700b0026807ec51aemr19828705pjb.41.1697079193746; Wed, 11
 Oct 2023 19:53:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230911171407.1572030-1-jernej.skrabec@gmail.com>
In-Reply-To: <20230911171407.1572030-1-jernej.skrabec@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 11 Oct 2023 19:53:04 -0700
X-Gmail-Original-Message-ID: <CAGb2v65BnLK2PWh_vnntCtQhCMrAu6segShTFzrfnZMp+VV5+Q@mail.gmail.com>
Message-ID: <CAGb2v65BnLK2PWh_vnntCtQhCMrAu6segShTFzrfnZMp+VV5+Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: sun8i-r40: Add interconnect to video-codec
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	samuel@sholland.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 11, 2023 at 10:14=E2=80=AFAM Jernej Skrabec
<jernej.skrabec@gmail.com> wrote:
>
> Video codec needs interconnect, so driver knows that it needs to adjust
> DMA addresses.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
