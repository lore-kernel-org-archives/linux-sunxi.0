Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A57C258F
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Aug 2022 08:38:09 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id w10so1255405edc.3
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Aug 2022 01:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=yIFcteN6sC/bfaP1WTd/RHoQds62wkqs1tJOKGjVr+0=;
        b=TeZv4iLFDzDlcRMZdcxFYD8iBhkkl6ru8OscF0CczIJjoMszenrw8WXPQMojvZNMOK
         yrAvVSDX9JVbS5BynSn+dLfRkI2zFiGvM0Oe6uKk7WyPVO9RJDVe9sqHugHczQfpCMDR
         ewTeM6bWdEy+c/W+FBLIRWgyGjZ+hn85AjjApkYMhNowxNh4Am5N3s80e9FzA7pkCxNV
         lI7T3WYv0MOOPYrSMD+bRtrut4zCc0dtxaV2bGCTh3VL/N5UfavBSYgyu6xT08ZKdnCf
         dJtGcL1ZgCr1ZZfPa1GrAiGI8cd4GsttG4+r/CH5iYJs6K1jAgkud5zOone5CA+39eU7
         sLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=yIFcteN6sC/bfaP1WTd/RHoQds62wkqs1tJOKGjVr+0=;
        b=kYoQhduyan+MWYeEoTUNNTZIhU6j8h4xYlufh/TnEb7wxNFLJ+cxg/AFM1poS2vttg
         uQdOTTnQWfNqqWS5LAbUape6X45hT2I5Hi+nsonU5RZQoz+Kg46rgYIEC+DLd9duFYJw
         fSLJP0OHdB555ng0WfvYjrv9hxqPnJShJkPEIoTE5DTSQwPmtjBQCy96Rtk/NRgIHc8j
         l9sJIrqoXn71OB8EnMygGYx47AohQE2XWguT0wxJeA5KRp+Kjr2AHLo2aWgaHB/FR6+/
         HLHj92M0TMCpMGSz6WEGuUyVIQgL2ARB24Qmkhu4aB8CIje2lhV40fvaybtzk5jjxShH
         7NHw==
X-Gm-Message-State: ACgBeo1yU9r1mg6utrjnQxg7uPASvkR5eVwzyc/4qZ1IwWEyb5+tSS85
	v5Cf/VJpb6gctoKlrW1Y5tJu4urZ2V+pBNzU07GjyA==
X-Google-Smtp-Source: AA6agR7ozWh1h3e0/Xth50fQGocQFY1NAJzq0Z5PFKq8ZMWLhAvNOdudXPHZBKkMRV1id5Oh5mABiceM7paZHMDcSNk=
X-Received: by 2002:a05:6402:5384:b0:431:6d84:b451 with SMTP id
 ew4-20020a056402538400b004316d84b451mr5948537edb.46.1661503087619; Fri, 26
 Aug 2022 01:38:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220819024541.74191-1-michael@allwinnertech.com>
In-Reply-To: <20220819024541.74191-1-michael@allwinnertech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Aug 2022 10:37:56 +0200
Message-ID: <CACRpkdbx+r8SLRAJKjMHGn1MzmcqmXhorXoPxouooMv6VJL89A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Fix name for A100 R_PIO
To: Michael Wu <michael@allwinnertech.com>
Cc: wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	mripard@kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 19, 2022 at 4:45 AM Michael Wu <michael@allwinnertech.com> wrote:

> The name of A100 R_PIO driver should be sun50i-a100-r-pinctrl,
> not sun50iw10p1-r-pinctrl.
>
> Fixes: 473436e7647d6 ("pinctrl: sunxi: add support for the Allwinner A100 pin controller")
>
> Signed-off-by: Michael Wu <michael@allwinnertech.com>

Patch applied for fixes!

Yours,
Linus Walleij
