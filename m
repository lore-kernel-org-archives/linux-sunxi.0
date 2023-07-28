Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975E9C2C0
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Jul 2023 07:30:23 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fe104df822so1413005e9.1
        for <linux-sunxi@lists.linux.dev>; Fri, 28 Jul 2023 00:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690529421; x=1691134221;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuQnxh7MQh36hqhWZvA+gANo32GIzZNpZKmW5WUO/yA=;
        b=C/1HiCTU+Mw+b3eoR6IdkYs/7otP+yYTwa6bk2vFBsbVXTxhoX/gVv2WD5gUWYMsLM
         MHivd0SfexVStnz/IFab5nvIk/ZsO5nk1cH/Tk97Tdova/9aKS5Jf7jWd3r9X8TjgJJL
         OpLxP+Z6TQb7XGQXvY5gGy11MROrouVDJDlj4HI6LuooGpQwgEaXN4KPa9l/7U9jVm98
         lBQSsbN99Qd2tzmuAlrvS9EixejNQ7iD9OJShmho1xx3xhzADntx5Nkpb0ibhmNIB+VD
         UFzXorGkVVGPc3HJBmUYPt1ME+0ZZlIftv/J2fhTe7fgxwlDDSxENQkru05grMLY7zyZ
         NSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690529421; x=1691134221;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuQnxh7MQh36hqhWZvA+gANo32GIzZNpZKmW5WUO/yA=;
        b=RVZFxCjEAEe8ezexIlSobVngzMSUPSB02F6G7bBVjROMfFHAjKkDksvSGNHYWVTr6P
         dWrFMENA2R8qc4EWcFmOpsvABBA2qJ6e0XKiqgFjtkUGVbSW1LbTdLQbgS9RSi3Dj6Vs
         NP7HBAiEVXeoH8vXa8WzwbnxVRdVYkbAzH1Qpy+lipDQ4MgtLcCLu9fMccmHIAN1k3ZF
         4ljvRrL7Baa+M7sIBkpUf16oqogPn9xlYoRsb/Wm2hI9n+RbLFz1B99utUYWfVOJQVmf
         5s6JHcAPMA7mx1thf5FUR+rw2uWMNAK1OPKcbkz7SMsu5e083sU7vrvSQfUrpRozOoZk
         Fy5A==
X-Gm-Message-State: ABy/qLYEBmw6voiThM/B3qvlQ7tF+nSS6FIq3pOl4qf61XyOfZC7eg2C
	LDC6+ZM+Dh4COq3PXjLhARGPrw==
X-Google-Smtp-Source: APBJJlG3GwSdYyJ9ZD6wjq+xys2sTJGzxdr8OpaSe18YZrBjk762oIdLMk314un2krsQe8jIPFim+w==
X-Received: by 2002:adf:db4a:0:b0:316:ef23:9276 with SMTP id f10-20020adfdb4a000000b00316ef239276mr1246966wrj.52.1690529421252;
        Fri, 28 Jul 2023 00:30:21 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id d15-20020adfe84f000000b003174f6dc947sm4086945wrn.32.2023.07.28.00.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 00:30:20 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20230714174820.4061387-1-robh@kernel.org>
References: <20230714174820.4061387-1-robh@kernel.org>
Subject: Re: [PATCH] nvmem: Explicitly include correct DT includes
Message-Id: <169052941981.85384.18073685620993485850.b4-ty@linaro.org>
Date: Fri, 28 Jul 2023 08:30:19 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Fri, 14 Jul 2023 11:48:19 -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Applied, thanks!

[1/1] nvmem: Explicitly include correct DT includes
      commit: 3e0558db94dbe5e5030a87bfd9a153d519d61b65

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

