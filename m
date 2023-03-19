Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB711373
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Mar 2023 12:06:34 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id r11so36794146edd.5
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Mar 2023 05:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679227593;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
        b=q/Wwmwtmi5ctcH6j5K3nCXBiz9uR0+OP/odaZ0yeLNMn0P9OkvfGw11VAgRnOyicjD
         dRjK50152RNnjgjge6gAAt5Oam85/MTmtLQltFikeLXblNNntYLDxeIl/jxH7cl6DlQU
         sY4XtUDCoocxbk8uJ7HOQfu1jUXU17C+IKRJby/o8bWFg/PmAAU/fafUO6CqreFLjueK
         aMRfAOGK16sg24DvYuSU3+cwAV/ypTXHaiO1E7FzvjPIDtQxYYpxTuvdJPLO5wV+DQCA
         oFGeTeBYPJtHdqLfLxMfW+FmzXsQe40biKcOOPKt9peVzMslgC29+L/CA9QbxDf/a150
         Ne3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679227593;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
        b=AbEzFY/vDyLVtC9Koilgx/pEqyObd7Y4ud1NUI7MSf0UlHA0wSR+1Q8/5VvOWPJiTU
         2w+hWSHvWS9w7PF4TUazXZe7X6wKurkX0i4z43cHc2PH9GeP4xL545XyvxOfr3SAAlAO
         mRcX4H35yopJPH0IQXhoejl4hVX2PZLcDr6jBdyup7ujoe5VwH8SqfMGDvm5uNWu10E7
         c+uj6xt8w2ku2wkmmlE4jfabyalVC3uGPVoSMOF8fyxpVpj9wBGMURRlGNaCzseCmW7m
         MD9XX+YPMc4cnS61A5ysbQg8HhF/9nt0dFJ8lqTAZh14gokv3LG2+sNTwVchX6VTO3Ud
         LSAw==
X-Gm-Message-State: AO0yUKXLXswoBFh/GTpgJyCuOkbmXBnxsQH+dwVpSjO4T7eRuLRVTxhw
	v/nS0Lq4qBSVFMUCIfurdeouVg==
X-Google-Smtp-Source: AK7set9NHq4wBQYJWJ/ZRlVN9Tlxwe4UcNKkxGkrS38jM5S1VezeVO4DSvYLo/+tr/EvFNS6LaAQbQ==
X-Received: by 2002:a17:907:2101:b0:8d6:626d:7e03 with SMTP id qn1-20020a170907210100b008d6626d7e03mr5390303ejb.40.1679227593238;
        Sun, 19 Mar 2023 05:06:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id i3-20020a508703000000b004fbd365fb33sm3468506edb.38.2023.03.19.05.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:06:32 -0700 (PDT)
Message-ID: <efc29278-b1b6-c30c-5c89-294e5198b80a@linaro.org>
Date: Sun, 19 Mar 2023 13:06:30 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: net: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Appana Durga Kedareswara rao <appana.durga.rao@xilinx.com>,
 Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Michal Simek <michal.simek@xilinx.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Tobias Waldekranz <tobias@waldekranz.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-aspeed@lists.ozlabs.org, linux-can@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mediatek@lists.infradead.org
References: <20230317233605.3967621-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317233605.3967621-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/03/2023 00:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

