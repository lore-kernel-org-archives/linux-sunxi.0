Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697B92569
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Jun 2023 08:43:39 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-56cf34a3c72so5219507b3.1
        for <linux-sunxi@lists.linux.dev>; Fri, 16 Jun 2023 01:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686905018; x=1689497018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcAlkMME68B/DMn58wIZvDIpfRVrA5pKETi1cowyEQ4=;
        b=LIShMYjdoGP04ZnI9mYPlm7+KOnQsqxwC3N1HHcwpk+mB25s3KACUgXvZomQesEUva
         8etO1cgSUlojGFMmcnm0VepC1cjTnz+DZxryzhQG0ISyow8S95Uun+nw4r5cQ/Adzjvh
         O5KZdqKIRLIAnZZo2077iRtcyNPverwIdLAun37ln/jyP64+Ntoqe1BrNJn6w8uW3Q4+
         RXjRAsPqoTSD07zBQXRQWz1bUyXXPYm04untstdJp4zIpxs2t6Y4fYl8fKHG6l/Bqhzx
         SHzJqGOMqKsMIj/wWOaBNo4qIlYXcvhNBJoNGtA5QEcFiqHw6HVji1nXXDdQLQUKNEGh
         AHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686905018; x=1689497018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcAlkMME68B/DMn58wIZvDIpfRVrA5pKETi1cowyEQ4=;
        b=bsRpUG2YyGH6iu82BMt2sofD3Zt6EXERjUk+lQ46Bt5wDqlfWisllLdv2W5+ngiJpD
         YVvu9cyUUy7D4wD4DBVSAydKstAPcQKeyz+D1ahTARZhCHjUtS9gw1azVpsizOGxzzPU
         56DOjIcKatLrvJ4hmbgZBY0m+CabWtivOJtTXxxkDeiSLQOEBGWDVbfx8bgZL5ChchVF
         VHb5humXFpAlzAQeyepCiMmwGzC4Sg6UkWITcmoXxtsOXaEl4Z7+NyQBpK6gm01gwtK9
         8TXfDD9IhsjcO4bijDPVOFlkUdV+pdLMu6sVojTNpB5w3bNdoGRi2rs+QcaYacfbD8zS
         rHUQ==
X-Gm-Message-State: AC+VfDzVnWepe8KQL6NPgaKqn17q5hWIkxHxIH4vY+w8S9+/zt/FqsgH
	RrHONC0EhZm0IbrVkdDlxKDiN8/NCuCAlpEZug==
X-Google-Smtp-Source: ACHHUZ7HXl5yZodGeTdNksuSc50SL1MwuhTSo/SCJY8XtVdKpO+fiVayDP8lN7Mq22lZDtZ8KzYaROiwwX8QDM9oh6M=
X-Received: by 2002:a81:7bd5:0:b0:56c:e2db:8d07 with SMTP id
 w204-20020a817bd5000000b0056ce2db8d07mr1000781ywc.33.1686905018211; Fri, 16
 Jun 2023 01:43:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230615144423.828698-1-privatesub2@gmail.com>
 <20230615144423.828698-3-privatesub2@gmail.com> <20230616080326.2vtkfeyzwx542hk7@pengutronix.de>
In-Reply-To: <20230616080326.2vtkfeyzwx542hk7@pengutronix.de>
From: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCo0YPQsdC40L0=?= <privatesub2@gmail.com>
Date: Fri, 16 Jun 2023 11:43:33 +0300
Message-ID: <CAF4idNm55=uFUTuoMaFHopMXZA04pQbhQDg4D8kpzp-G7rVSRA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Maxime Ripard <mripard@kernel.org>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

=D0=BF=D1=82, 16 =D0=B8=D1=8E=D0=BD. 2023=E2=80=AF=D0=B3. =D0=B2 11:03, Uwe=
 Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>:
>
> Hello,
>
> this isn't a complete review, just a first quick look. Up to you if you
> follow up with a v2 fixing the things here. If you don't I will take a
> deeper look at a later time.

Thank you for your review. I will take your remarks into account when
creating the v2.
