Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77A52099E
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Jun 2023 20:24:51 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-30ad458f085so1669170f8f.0
        for <linux-sunxi@lists.linux.dev>; Fri, 09 Jun 2023 13:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686342290; x=1688934290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJmj9RC7JrITIeRp5vwXnIagysFthIp7E3tpcobsSj8=;
        b=aYWGftir4Nc0j9T69cdUswXKfbAiXdRkiRgLgMGsiBKusnCe0+DlWwb2yuuvn72HwJ
         X4IezSIQPb7u3npkdJlqOoO6d6I+c6TtF/kuMbde4JJc+HGIdu2KSDj8fLIE4fEwupXN
         Sf+ZHOUuw/wetUP04lLZI9+Jup0vc8i988wlPVX7YLPhbQvNXohLlZzK013zifGCM3hA
         KEevlSG1sXKznJkQPUJtjjGo9yKjAQhq+qjzXXqX2upGqtKHqHNZEP0UepaxdENiRoLj
         jbKYABKNqj/i+ytjice+rPCoDDZ3dfEILnNM3Q1GKvCrFeJdbttiZYIjTzeJXeGIzBRU
         cH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686342290; x=1688934290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJmj9RC7JrITIeRp5vwXnIagysFthIp7E3tpcobsSj8=;
        b=RaZKdxdH8UY1OsQLQfZtIEx6DZ0HCmclScJLqRZ8wjMvx/Ikm57HZwglX1dReghFXO
         LCdK8KTbM7Re7YxfXuNiIlI+sJItw8BpNefLICYihdcF6ugfW1A0ZNnnLY0EpB4nN25T
         jZBdtmvueOmkI7idrxvMyGAK4zznTT/bPbFnqml1nf6D5k0dceCQ9KlAf6RHLg9TSkMU
         sI0ZVwqeaKNhSirLb3uAiZpz3npKy2JglonpNnfTzSVIGkQkuOdVRnps9/8rDRhsuphX
         c0nRzyrMoEhuWYQ/aPHNtW55bHLhzcsQTSJn/2kYRLdACZkPpvE6tmGvYuOzZ6a+A6py
         IEHg==
X-Gm-Message-State: AC+VfDxWO+By/n1XGH4ap1i/5YdebjdUmLUEhLsB9Tl52zq2uHZHi8wR
	EXmfqrlhg3HMwcoPhsH4m44=
X-Google-Smtp-Source: ACHHUZ6ZBgWscntQGExTdvlE8rW0jJ4+GYUdtTFcY43K2guECx9whpzgsfcxffLEmh9mnGD8p+JECQ==
X-Received: by 2002:adf:dc83:0:b0:30a:e901:bc66 with SMTP id r3-20020adfdc83000000b0030ae901bc66mr2290935wrj.5.1686342289715;
        Fri, 09 Jun 2023 13:24:49 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id a9-20020a5d5089000000b0030ae973c2e7sm5294671wrt.83.2023.06.09.13.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 13:24:49 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Mikhail Kalashnikov <iuncuim@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>, Icenowy Zheng <uwu@icenowy.me>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/5] sunxi: H616: dram: const-ify DRAM function parameters
Date: Fri, 09 Jun 2023 22:24:48 +0200
Message-ID: <4490774.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20230607000745.10245-3-andre.przywara@arm.com>
References:
 <20230607000745.10245-1-andre.przywara@arm.com>
 <20230607000745.10245-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 07. junij 2023 ob 02:07:42 CEST je Andre Przywara napisal(a):
> There are quite some functions in the Allwinner H616 DRAM "driver", some
> of them actually change the parameters in the structure passed to them,
> but many are actually not.
> To increase the optimisation potential for the code, mark those functions
> that just read members of the passed dram_para struct as "const".
> This in itself does not decrease the code size, but lays the groundwork
> for future changes doing so.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


