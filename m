Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9CD5CB0
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Jun 2023 10:41:42 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-bad0c4f6f50so7844738276.1
        for <linux-sunxi@lists.linux.dev>; Tue, 13 Jun 2023 03:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686652901; x=1689244901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qo000+tMfEFV9hbsc5XmyKHzqMjtEWqkHh6QiK4Kq7s=;
        b=qMUmc60ww/4ajFHunUj0BtpTP4X/HfcNS3MKa4p2WgG2GkirJ5wh6AVhkXSgMZN22z
         Tg+cUHVX38Krjy9r4TeuuGEiMhAQMFwvuEb/rFTmPb5YkHJksF1qkUfriT0Dobk/idEl
         wc2TkevY8VmKoolqfq0bQMGg2nt2igg2mPb6rQQ2S6A8w6ZIVK400+ylusIvzoqeyOMN
         2zdFbL1mSc5HYsluM4+o0IqHq6GyJY1FB/FJ9BAttq+pxouPyZ0r1cq06YOMXYbaUzW2
         eCV3XdPDUpjnhod6HsdQssXqwRPe7SAXr8liMzszzJJIuk0pB7NRiOUZWv1Wqeyg6SL+
         7sEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686652901; x=1689244901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qo000+tMfEFV9hbsc5XmyKHzqMjtEWqkHh6QiK4Kq7s=;
        b=fuf5V3m2PsEPy+NLTFW52DHkL2AV4XPmkjEoZGbX2GX07kjiSegNbb6pWdqCsjuaz7
         2umpw9xg8sJ6FVrNETh/Ld1kDcqc4P8Hs3f3FnkfLmNeFo+7vGAqdPNL+dwuIeGQkWFp
         a1Rfccp4dfyxikYegyQvcjwVKD9ddW2+TZVLxj6AgWdaN3+NSt2BCEeUuC2iA9hJAI23
         5xSl3WU2jpibYMojxHst2inXXrcZvR/wL7BRrHglXO9PXp5Hmkw2xFWF/UxUNoGcnYR5
         KKRz3ZA9SY5NORLFrpp55CMtxOZTU7lvV6q+RsaClX2rBqQr2zDsAIgUY8Vkf+q5saFB
         oUyg==
X-Gm-Message-State: AC+VfDwtx0y6IbvsiQBFE3ZaHjjpQKw0cn2vFCOkWYhSYC6hbKxiaSos
	SxzDD0r2wKNeiD/pyY0UKv6ivRgLtlqUn/DsK9u5CA==
X-Google-Smtp-Source: ACHHUZ7wXx9rL56M5TKSV8kIC35q0vxCnpiKFzxTQQHuOUbix+dPl8Nt63ZFe8Rva1rLJeB/BK0wLo7CntP9BKwy9aY=
X-Received: by 2002:a25:8d85:0:b0:bac:ada7:140e with SMTP id
 o5-20020a258d85000000b00bacada7140emr1130861ybl.9.1686652901179; Tue, 13 Jun
 2023 03:41:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230613095624.78789-1-frank.li@vivo.com> <20230613095624.78789-9-frank.li@vivo.com>
In-Reply-To: <20230613095624.78789-9-frank.li@vivo.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 13 Jun 2023 13:41:29 +0300
Message-ID: <CAA8EJppgSg8TJOABkrNzBRYnyu33XuJF4DYmp2d++Pifx0Hpqw@mail.gmail.com>
Subject: Re: [RESEND 9/9] thermal/drivers/qcom: remove redundant msg
To: Yangtao Li <frank.li@vivo.com>
Cc: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@linaro.org, 
	amitk@kernel.org, rui.zhang@intel.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-imx@nxp.com, thara.gopinath@gmail.com, agross@kernel.org, 
	andersson@kernel.org, konrad.dybcio@linaro.org, anarsoul@gmail.com, 
	tiny.windzz@gmail.com, wens@csie.org, jernej.skrabec@gmail.com, 
	samuel@sholland.org, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	edubezval@gmail.com, j-keerthy@ti.com, f.fainelli@gmail.com, 
	linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Jun 2023 at 12:59, Yangtao Li <frank.li@vivo.com> wrote:
>
> The upper-layer devm_thermal_add_hwmon_sysfs() function can directly
> print error information.
>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c    | 4 +---
>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 4 +---
>  drivers/thermal/qcom/tsens.c                | 4 +---
>  3 files changed, 3 insertions(+), 9 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
