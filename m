Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365FB1F95D
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Jul 2023 17:57:24 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-666eb03457cso4404598b3a.1
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Jul 2023 10:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689184644; x=1691776644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qxuOcBIWNZMHeehblHokbsTjPg+FYuoiZM6k4SdRa/E=;
        b=cxcCwIPyzZ4qgKDW0VctV/PwmvJSO8ULM+V5gPu9nD0DNJLPYlYATUivL5iC3TQKrr
         mNbjcaOIQ0Bxc63aZ+0xzNq3BdttdirIR6YxCuzf6P/e5OzrT+VHr31eZlgZyoDbyuPo
         C0OtkafeD58d3trFvviKKu3/l8eRKD2wDc5A3IyaraWwJhrHHaxRYqd/8mIPaleYL/6F
         S0JhmTHtxWgZD+zh3B/M1CAkAaYhNGe0kLYgIu2bJuFGfCm1/Jc5zxRyot5oAvarTmkh
         sdRBOYO61RQoQrO9hcaF0thSw4RwHMwLs6zmhfcgIpPupryQ1oD4KxbQcLf9SxXs4lqg
         gP+Q==
X-Gm-Message-State: ABy/qLZcQ7148XJnqxCbt5WBByGaVUlvTecD8740i8vepHWyWpboSC/1
	6QlVn6CfPS5opgxaADga6uoSIfBMqK0=
X-Google-Smtp-Source: APBJJlEJ8DV97gqya1wNdZ1JSLE7uDazsFfcMPOat2uV8Maqk64vamgPVZXdcM8jTVzBxQcpVaOFGA==
X-Received: by 2002:a05:6a00:a1e:b0:66f:578c:59fb with SMTP id p30-20020a056a000a1e00b0066f578c59fbmr19256768pfh.10.1689184643869;
        Wed, 12 Jul 2023 10:57:23 -0700 (PDT)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com. [209.85.210.176])
        by smtp.gmail.com with ESMTPSA id x13-20020aa784cd000000b00682a61fa525sm4004973pfn.91.2023.07.12.10.57.23
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 10:57:23 -0700 (PDT)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-666e5f0d60bso4386220b3a.3
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Jul 2023 10:57:23 -0700 (PDT)
X-Received: by 2002:a17:90b:1e05:b0:263:ba18:3bcc with SMTP id
 pg5-20020a17090b1e0500b00263ba183bccmr14485877pjb.46.1689184643375; Wed, 12
 Jul 2023 10:57:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230712-pinctrl-sunxi-boudns-v1-1-85f37de79b9f@kernel.org>
In-Reply-To: <20230712-pinctrl-sunxi-boudns-v1-1-85f37de79b9f@kernel.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 13 Jul 2023 01:57:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v66ErOTdk0k+weHg6rsyOmsxUEiwRqCeBN3ERK0GmhO6iQ@mail.gmail.com>
Message-ID: <CAGb2v66ErOTdk0k+weHg6rsyOmsxUEiwRqCeBN3ERK0GmhO6iQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Add some defensiveness for regulators array
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 1:20=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> The sunxi pinctrl has a fixed size array it uses to store regulators used
> in the driver. There is currently nothing that ensures that the number of
> elements in the array is large enough to map the regulators defined by th=
e
> individual SoCs. While this is currently the case having an explicit chec=
k
> in there will make life easier for anyone debugging memory issues that
> manifest in the driver so let's add one.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
