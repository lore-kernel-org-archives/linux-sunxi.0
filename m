Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4962F2F5E
	for <linux-sunxi@lists.linux.dev>; Sat, 21 May 2022 15:23:01 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id e28so14424239wra.10
        for <linux-sunxi@lists.linux.dev>; Sat, 21 May 2022 08:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JvR8EfMneLH17KDR7mkxGH6ytw5t2KWJ1oGbwHLRP+I=;
        b=BE7C1sg9dwzS9wigMsHqlYA7qZQXESfP/NvFZo+4WS6FP3c/O0C/8Ysg6l3Xl5JHlb
         H0n9t9ts/9kvykGHTILqJFh8Y5wMUns6Jx0LKO3ccTQitCPAFC7jrpHOc53TrCdEvrEl
         1Qdf4B3/wr6rCHn6hF7TA4OiD9UJZfsshwT1JMXrNpM/MfIe72xSyPCtIfuRlU/uPqHJ
         GMEsIFoPEVfqsZ0nXmdk/5frWRkyUKOLMzfl+8b+y8z18S27vVxMg/uXEbNdT7cwHuw8
         XWzYUW8/Uszu/HSs+t2SpLO8RiYRpE3CgjNwrXjvSTQVkKKGFK09W5Dg6qcVBF/wO0Qr
         cVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JvR8EfMneLH17KDR7mkxGH6ytw5t2KWJ1oGbwHLRP+I=;
        b=6C3f440MIRo+UISTlNyZGCSNiLdUHDx2SOqtUOQdSVzT2qebjePNq99PeSuFGekJJx
         bhkizTKIVzmf1ZWOkFTlEw3mkhqzG9iNDS4Wwe0L2vgv+MrILRCLtM6El7q7PNPI3Jsm
         bjSw71VG3jmoHOFRIAbKvjNNNP7GngOUD01TJTOZ7UZGclbDaTgiiDKlThq4hJqVYjjO
         wJku63SaY29Hymm75W+feMHWLVMK9mqX61YgK0vb5XhfEctkBVNjkLepKzeA3rx7pd2c
         SDRbC1BFI1UtbooIlqx+v2kQtWOD3KCGlmZXx3r7s95vFz5W+FynwConnd1JwQMvuPNY
         taaQ==
X-Gm-Message-State: AOAM531OyZACRWVu4mF2uFhfrgoi8IQSaEyUnwYPANnKCehCevcSdIDS
	Hx8Xq7xWYh9pMaP9hk7TLSASnZuPuwoAow30eKA=
X-Google-Smtp-Source: ABdhPJy2otIU6LY2zRIkW7mIAELe35y0IXHfO2ziBmZjskvQSLFDXG9FhwC+MgwvPK6BWB/YN5t8Bs47fz7TL91u8xg=
X-Received: by 2002:a5d:4892:0:b0:20c:d4eb:1886 with SMTP id
 g18-20020a5d4892000000b0020cd4eb1886mr13053812wrq.96.1653146579366; Sat, 21
 May 2022 08:22:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220521111145.81697-36-Julia.Lawall@inria.fr>
In-Reply-To: <20220521111145.81697-36-Julia.Lawall@inria.fr>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Sat, 21 May 2022 08:22:32 -0700
Message-ID: <CA+E=qVc-_NbBhybRs8aAU324_GMYAokmZT3mQZN796x6u090oQ@mail.gmail.com>
Subject: Re: [PATCH] thermal: sun8i: fix typo in comment
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linux PM <linux-pm@vger.kernel.org>, arm-linux <linux-arm-kernel@lists.infradead.org>, 
	linux-sunxi@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, May 21, 2022 at 4:11 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:
>
> Spelling mistake (triple letters) in comment.
> Detected with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Acked-by: Vasily Khoruzhick <anarsoul@gmail.com>

> ---
>  drivers/thermal/sun8i_thermal.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
> index d9cd23cbb671..212c87e63a66 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -237,7 +237,7 @@ static int sun50i_h6_ths_calibrate(struct ths_device *tmdev,
>          * The calibration data on the H6 is the ambient temperature and
>          * sensor values that are filled during the factory test stage.
>          *
> -        * The unit of stored FT temperature is 0.1 degreee celusis.
> +        * The unit of stored FT temperature is 0.1 degree celsius.
>          *
>          * We need to calculate a delta between measured and caluclated
>          * register values and this will become a calibration offset.
>
