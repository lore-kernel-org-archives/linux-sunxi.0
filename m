Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EFE2589
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Sep 2022 11:00:01 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id z25so14222690lfr.2
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Sep 2022 04:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=4DmliD4/zIbuq1/hYo/pvsJYEUacMOuT576x7WYBpkI=;
        b=xYUh82Zyx9wOjMvPUvP+6d7lEmi4uSdWgPAbfRDS31BFI3WiHx1bLSVHb04/dG4Xjt
         Oz0XaMRqI+RVrljbCSOuNVrEXkRG6q3MW/uEvM5yMMIhf8rOP9XqaO6tvsqfkGdWAgNl
         YOPs4EXq7jJo1pJe+u3F9jG4xAJOnlBk1Ng++dbH2681nHE3h5HyiBiJS0997Sc6nZvq
         V/alJlR3RKx8runQp//qjUyRQL7hwXkgJfs/Pj+qPAbWTfgmLxWtnVJjAmhPV6/Pivla
         5WvQaYYrwngfOq4GFdJDVGptZt+d7WaDa8SGOzspQ0HKtlyGhwmWTkHzuZYCGTsWlfXb
         hxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=4DmliD4/zIbuq1/hYo/pvsJYEUacMOuT576x7WYBpkI=;
        b=CcJcpzLv1NeKKdDGBVV9wUir8ih9axhVBokez0wZ6N3gZLcIzNF5j9ziGKj+nJaEPq
         ecziW2+n9cAfmllp+r0M24fU91TR7o/DNbfDEmz0gvEIA5T9QtXD+Ga/BNkf7jy2WcTF
         QR+rqoMyPy/IpKzC+5iZfoUHfxhhtWHkZf2TI5xi25lVfaLYQDRu9nYy+721lRf1jvOm
         pOLLMXTBSqEpUBQW4B6InYi3zNJ8QFyuv6WWMwp1rVcC7NdogSOqGvpKFfrRJJIYiBXW
         wEydktY+zdlP6FEyCt92xXpqVRM1itGtLJgNaqAeMh7ekJJbjWhi9xZjo6lpv2dgDs9j
         QQdw==
X-Gm-Message-State: ACgBeo1B+qoSu5CPg8d206RjLfKfhhp0HKE24pcSmlm8erdMdZ1cv0T1
	gYC9bwFiMhOmJ+4QLn7JdMcRvw==
X-Google-Smtp-Source: AA6agR7JWVX4/4qKNWe/mwV9K0XiykbUAzUfMg4rLs8KCX/XP+IHWn3pNWkdAf9vO1D8pXUcvatRGA==
X-Received: by 2002:a05:6512:c18:b0:49a:d44b:435 with SMTP id z24-20020a0565120c1800b0049ad44b0435mr1144873lfu.468.1662980399214;
        Mon, 12 Sep 2022 03:59:59 -0700 (PDT)
Received: from [10.129.96.84] ([109.232.243.34])
        by smtp.gmail.com with ESMTPSA id s15-20020a056512202f00b0048b003c4bf7sm1002592lfs.169.2022.09.12.03.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 03:59:58 -0700 (PDT)
Message-ID: <0826b754-4027-bda3-b8ab-06dcb7292c90@linaro.org>
Date: Mon, 12 Sep 2022 12:59:56 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/7] dt-bindings: usb: Add H616 compatible string
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Karl Kurbjun <karl.os@veroson.com>,
 Icenowy Zheng <icenowy@aosc.io>
References: <20220911235945.6635-1-andre.przywara@arm.com>
 <20220911235945.6635-2-andre.przywara@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220911235945.6635-2-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2022 01:59, Andre Przywara wrote:
> The Allwinner H616 contains four fully OHCI/EHCI compatible USB host
> controllers, so just add their compatible strings to the list of
> generic OHCI/EHCI controllers.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
