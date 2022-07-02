Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43AB1FCE
	for <linux-sunxi@lists.linux.dev>; Sat,  2 Jul 2022 19:10:24 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id c13so6689797eds.10
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Jul 2022 12:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UJWlBpt+Os9VSBvRo2e/skaQ1cvHZOQHuCjAGyhuyPw=;
        b=Zh0ZKdt3rHXANFz38Aylc49cbOlEXMz/vDbBIeLvIzyyBK0L5IVWIIWWMlOjjcrINB
         Re9B7YvR8KTuP3c/zsxXpQUrcIQ/8IaJO8VcfXolR2t8OTFiFETd/M7aD7FeDp8T+k6j
         /WwkrafU6tRzmXho/Crt3BcXxUMS1v5OR0hOvrq+LJnnmOJfarj5cSoh7mYvqCluJmVE
         3ThCf5mhHNewOe7dwj/0TFfZeT32fox+pCI94bwAaQMUH6jsCordmv2vZB6NhG2Un7pc
         v9s40ZWJX02EVtd4tQ0RqZJWtgQoGTehoULlOynga9qDPzS05bFC3USAFO6TF6OSuKYg
         b91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UJWlBpt+Os9VSBvRo2e/skaQ1cvHZOQHuCjAGyhuyPw=;
        b=0eb3V67ES+k/ceon9kxpU31s8mA25dbUtPVL0CaF+Ht05dDJHN5nwMFZeHZaiByRZi
         YWwYbRBO6i2DbRT77mak6Xbj1fUyuKnUgXtACi4MLtqRcw15Dij36JMSX7KjF+hE/LWE
         NN28SJL53TMWVcHP27sLwia9m7RjsDKbgAJBrxBNgNabktbP9DuetPxq4p+aDzqx1rcS
         YXXiOtFNw+lc8SCMEUftNbNR5PWcehRJoVAPrIgA376FkJlAVrJAvD0GtlUgXZwdKMpx
         S6MVrBSUFMcNLKPHNBYlJCJJj4el9HkB8V2u0IDQs8g3yudmYddpigsktPw+lwsDX5bM
         peMw==
X-Gm-Message-State: AJIora/HLOerNxgL9fhK5rNOrdF7Gh4jOi8FxvS2FUP71dcpXNVKdicu
	2No51FflhNMm+3V41WcFGig=
X-Google-Smtp-Source: AGRyM1veNLYsqyxkP9J6ypKlqwBrT0s7i8IRXbIqDNfN/1ELacSMYeqk5kXKoeVj6P8AkpFWag0YDw==
X-Received: by 2002:a05:6402:3785:b0:435:5d0e:2a2e with SMTP id et5-20020a056402378500b004355d0e2a2emr28146324edb.307.1656789023118;
        Sat, 02 Jul 2022 12:10:23 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id a21-20020a056402169500b004357063bf60sm17228262edv.41.2022.07.02.12.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 12:10:22 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/2] clk: sunxi: Do not select the PRCM MFD
Date: Sat, 02 Jul 2022 21:10:21 +0200
Message-ID: <5733611.MhkbZ0Pkbq@jernej-laptop>
In-Reply-To: <20220702190135.51744-2-samuel@sholland.org>
References: <20220702190135.51744-1-samuel@sholland.org> <20220702190135.51744-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 02. julij 2022 ob 21:01:35 CEST je Samuel Holland napisal(a):
> The PRCM MFD driver is already selected by the two platforms where it is
> actually used (MACH_SUN6I and MACH_SUN8I). Selecting it here builds it
> unnecessarily on the rest of the Allwinner platforms.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


