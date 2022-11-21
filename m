Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D0DEA6
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Nov 2022 10:16:39 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id b3so18120143lfv.2
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Nov 2022 02:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=phJFVLoc9/POc6nbD0liFwrgYsKAiaNUs+VrsQZny0U=;
        b=HMQtLNQC6JHUcpQnXKaMPeLJYNEXESjWqW9Jm9fxHdDsyxq3fD2y+gUbum8cazGLlS
         0Nzot0o7wlI3aHmX0JtEp59ASN04zoUP5cBLwhJUS8UWXS1vrDPK5s0nm6MtNyPRkAXr
         i9HRjhzMXJwfcX+oinAm/OP6xU5bC2NyVL00djub62igijCsqVS/+Gs3g8Ob67GV62e5
         lbpACEGBVz+P7gegvEedJPLtYc/UAuXuZCP3D6YMe70yXUQfK1oo2OuCbl17wDJsWOWJ
         juioZPmih2Q2tDZ+3ZlWsJUEwqpG6mEfuUGwVkFA5iKPxQNEPbzHK7gtA/8R8W2wDMdd
         a+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=phJFVLoc9/POc6nbD0liFwrgYsKAiaNUs+VrsQZny0U=;
        b=S/rVIsypCG4MOL5JE5rXVvIGNdR+5Vil9K3xSIoEcz88gc/yTkZPmbwKEUFrWdyO7/
         iVoI/aEim2ZcjYr9bh8Y1h7qs80Ohqe6qVtlmcupTGyYTsFNtLaSYa8dEFv2x7ah1+Zb
         fhwV6/vrEs7CfZJq5E4KrUaOamhS6CgUDc62/MSK/aMzCEryEOdtVHCkBKpCwyw3kMQM
         FFQuDrCgru3tZSoI+vXenftlUB9rAhQeFVnZpVkN2jhGj2d1znaruU6Nu4uCJWxSHARc
         2Nlz1bd7U5aoL8tt0YUIcTgjxmQREY4ZLC933vxp6xYK4PxWlf1VrHALg1o9jDWoxspw
         jt5w==
X-Gm-Message-State: ANoB5pmGanZZxC6LfcHoMw+VNA9jCVgASQR+hUYhmtNemu61yB4KXAdf
	ylcIX2Aqo8xt1cVnSk8Nw6s=
X-Google-Smtp-Source: AA0mqf4ot1dRfz4XcQJOzbIEVDNmvoy9FxZf/F3Gx+j1WTmSwhOpMtvOjIltFzq0/t2LrM51x6qHTA==
X-Received: by 2002:a05:6512:2521:b0:4a4:5e83:e07d with SMTP id be33-20020a056512252100b004a45e83e07dmr1937785lfb.409.1669025797870;
        Mon, 21 Nov 2022 02:16:37 -0800 (PST)
Received: from [172.16.196.95] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id e8-20020a05651236c800b004a03d5c2140sm1957388lfs.136.2022.11.21.02.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 02:16:36 -0800 (PST)
Message-ID: <20825b50-c2ef-7efb-efbf-ac00cc4ab9f4@gmail.com>
Date: Mon, 21 Nov 2022 12:16:24 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
From: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH] dt-bindings: Add missing start and/or end of line regex
 anchors
To: Rob Herring <robh@kernel.org>, Ilia Lin <ilia.lin@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Yangtao Li <tiny.windzz@gmail.com>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <mripard@kernel.org>,
 Daniel Mack <zonque@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-spi@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20221118223728.1721589-1-robh@kernel.org>
Content-Language: en-US
In-Reply-To: <20221118223728.1721589-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/22 00:37, Rob Herring wrote:
> json-schema patterns by default will match anywhere in a string, so
> typically we want at least the start or end anchored. Fix the obvious
> cases where the anchors were forgotten.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

>   .../devicetree/bindings/regulator/rohm,bd9576-regulator.yaml  | 2 +-

Acked-by: Matti Vaittinen <mazziesaccount@gmail.com>


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~


