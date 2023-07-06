Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5382F9461
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Jul 2023 17:08:49 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1b8ad356f03so6334475ad.1
        for <linux-sunxi@lists.linux.dev>; Thu, 06 Jul 2023 10:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1688663328; x=1691255328;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDFcTWubp+txWejOhlaxkosc/sM3fyBrGXhY50V6+cc=;
        b=Q3tIlLGo1iMeILb+g6CH4AIl3stIczQL9hbypUuloisr7dgdnhmwB6ISQOKN6BvnsJ
         K3O1JcQ5v3+cL1l+D2w4fY7JLprWSNENfngJS/iyg2okZpdYyQj0nlKgzNGHgR8WVuCG
         rUuF78Z/asu/0QEztqH4ky05n9ZBKsI5h7Y55PmYGCUO9CHIjY8e7UQ1Btp63JMcRwzq
         jhGDhbhg1BhKE7eMImJDzMF2Do6AD2gKr/BI86yx2Gr2orCka1+ixbby0Tv5EKv7699d
         AWaojvSBoh3rC2chnKJ4rpkDNiNOHz5Y1/OwlK6eYZQox6JAojJLfoF6o08bcjzr6IJ3
         tr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688663328; x=1691255328;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDFcTWubp+txWejOhlaxkosc/sM3fyBrGXhY50V6+cc=;
        b=E0XjxUVRELXfQ6bEWCg5/ETNKGLU8F2E3M30t0b/2WZ8GEHOTbyVljEvuyis4vILLE
         MnUsR1nfR1aSWtkUGEi66rc5dDgFI6iSGiT1FW3vxiCmLJ/M+shz2s8WsN+YCFWlFlXT
         pxoBp+fPZR8Y4sbPiKg9s9EL+OXtjXAgGlf7i8DPDdPsAnhfBB2+JBufa8OvpkBjUnYe
         8Jgc8HtmpXVYF+n+1GsHaY0asNndTl/Rmeg72Qu3foVQkzw4W5mQcY1hFn0TsMkj+zy6
         34L9ItsCW+D0u7faIWz7HRHYgKE3ntAC5V7e6agbOdhsmzSmIYBJ7dVuG13c2Gv/Qbsj
         RAdQ==
X-Gm-Message-State: ABy/qLae1ZYdNN/2gE2mn7yn14QPfMNKCGBKCt2j6rphqryuBrcWxtW7
	2bHKyuGlfgl6oVdc+jXq6XZgRg==
X-Google-Smtp-Source: APBJJlG74eEINUstmC9zOo36wEsjfZVnckhU+vtEAepiS2jkRuh+o/vzJ/8elzyQtASPJfPTGwaDJA==
X-Received: by 2002:a17:902:efd1:b0:1a6:4b60:3195 with SMTP id ja17-20020a170902efd100b001a64b603195mr1567784plb.66.1688663328525;
        Thu, 06 Jul 2023 10:08:48 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id p6-20020a170902b08600b001b8a7e1b116sm1668898plr.191.2023.07.06.10.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 10:08:47 -0700 (PDT)
Date: Thu, 06 Jul 2023 10:08:47 -0700 (PDT)
X-Google-Original-Date: Thu, 06 Jul 2023 10:07:29 PDT (-0700)
Subject:     Re: [PATCH v3 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
In-Reply-To: <20230627082334.1253020-1-privatesub2@gmail.com>
CC: linux-kernel@vger.kernel.org, privatesub2@gmail.com, thierry.reding@gmail.com,
  u.kleine-koenig@pengutronix.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
  wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, p.zabel@pengutronix.de,
  cristian.ciocaltea@collabora.com, Greg KH <gregkh@linuxfoundation.org>, linux-pwm@vger.kernel.org,
  devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: privatesub2@gmail.com
Message-ID: <mhng-0cca3d46-6031-4e8a-8e8f-2c479a20b95d@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 27 Jun 2023 01:23:23 PDT (-0700), privatesub2@gmail.com wrote:
> Hi,
>
> This series adds support for PWM controller on new
> Allwinner's SoCs, such as D1, T113s and R329. The implemented driver
> provides basic functionality for control PWM channels.
>
> v2:
>  - fix dt-bindings
>  - fix a remark in the driver
>
> v3:
>  - fix dt-bindings
>  - fix sunxi-d1s-t113.dtsi
>
> Aleksandr Shubin (3):
>   dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
>     controller
>   pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
>   riscv: dts: allwinner: d1: Add pwm node
>
>  .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  86 +++++
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  11 +
>  drivers/pwm/Kconfig                           |  10 +
>  drivers/pwm/Makefile                          |   1 +
>  drivers/pwm/pwm-sun20i.c                      | 322 ++++++++++++++++++
>  5 files changed, 430 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
>  create mode 100644 drivers/pwm/pwm-sun20i.c

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I'm not sure if this ended up somewhere, but I'm assuming it's not aimed 
at my tree.  LMK if you guys want me to pick it up, I'm dropping it from 
patchwork.
