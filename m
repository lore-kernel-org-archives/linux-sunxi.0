Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397481FB8
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Mar 2023 06:50:06 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id r11so55735466edd.5
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Mar 2023 23:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679381404;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AVZ6hZGV1be7TstieJ1z6Us2bdyl2vfl7ifo76jUCuw=;
        b=yfBGAkzYkRznU9Ng945BSIqo31Bk5T0PtagdkfIHR2Q1BeqH5OnMJ4fsG1zFEiehiS
         KZ3/pYphUZP+d7j+TETF5ibJ22qi8JxUtbeR5/rMsVWBLbLtVafpphEGHOgtkfufvthr
         kfFqq23RxghjFGHcvf7wzurvqXl77TX0lreCe4zdMXibkctRdAIFIHy2nFlymDviILbG
         cJHWfu2Mf2f0H4Zek7CU3vs712CDHZtYrkN+Dnj8r9iTZ3wsTUFj2dPI9y02J/EmUF03
         XuUbrwNwkbxeyyaBiz152Yt33fiVzez/AHc3FxXutFCupBB3a+cT+4yKOMj9xOon+xKG
         WmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679381404;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVZ6hZGV1be7TstieJ1z6Us2bdyl2vfl7ifo76jUCuw=;
        b=C6Z0LxKd2Sd4AXnt8tlb+HKwvoMgmYhwaFSoF0tyOAOENKc0Kel+NVfie901ElrIql
         g/KjZ2JB+5fvoNiQGpt6jrhzwHWfrYjHZURwh8sUCwEg7mJQfSUHvqKxCCP9DfSper3I
         to5Fidg0t27Hoh2lGC1Za5Lm3pN2hBtBgkFq/FfFngPlb7uWiWm8OtlXk3V/C8tl9V22
         rzygTKuoejOQWL/LJzZbwkgbxgqxPVR1RJgCIlPhys0UN2HNJmi0UnGljlvudGeaqV9y
         qW06RZGER0/8sdqwOejwmxEqSubeq5E7irxe+MyHur/7U4LmtlDzpevUPWlg9BDvmIWC
         E+fw==
X-Gm-Message-State: AO0yUKXwB3l0QaegGm7wog/DlIBnF+dzNcbhYqQLeGJoEJb2HBnTHhb9
	ouRuwesMb0ZZWIGSiw62pwWVsg==
X-Google-Smtp-Source: AK7set8eB3GSlawOodRmMBJ+h20F9+s+seoY5Xp11h5THWtKB+BDrw+xLcE75DD32t4gpHpf4nRxYg==
X-Received: by 2002:a17:906:6449:b0:8b2:abcd:624 with SMTP id l9-20020a170906644900b008b2abcd0624mr1888422ejn.0.1679381404434;
        Mon, 20 Mar 2023 23:50:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id z16-20020a170906715000b00930894eb708sm5361112ejj.223.2023.03.20.23.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 23:50:03 -0700 (PDT)
Message-ID: <c9365b87-3cd5-9df6-7f2c-e4e848165062@linaro.org>
Date: Tue, 21 Mar 2023 07:50:01 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] media: dt-bindings: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Joe Tessler <jrt@google.com>, Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, Heiko Stuebner
 <heiko@sntech.de>, Benoit Parrot <bparrot@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230320233944.2920964-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320233944.2920964-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/03/2023 00:39, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

