Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDA47E
	for <linux-sunxi@lists.linux.dev>; Fri, 20 May 2022 06:45:18 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id g16so8632853lja.3
        for <linux-sunxi@lists.linux.dev>; Thu, 19 May 2022 23:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=AnEwnvhKln/QqudtDrsLeq9rcJ9ha/C6wjXnDVo990k=;
        b=O6glMIfzZPcKFuiAIfpgKl4vPS6f/5kKRDEsCZ51jhpn2nvRMnbXG5g+EDHeE904nP
         t7HS+b/93itLD8AaEQHAOU/xrWjqGgTNAbPH9jakVpgMQTIhKd99kpg+p8rnNvdIqwdN
         6qoJ6hv6rNLvwFxEXHoFISEMQCRvxYIVNP2Tdx5gjSpfV8JASem8ZyxogIrKo+3noZeo
         On3nePrDC2RBv0fxVZnC2PEjR3MvP9xqKuaD0jO5YVuhsa36Q52R9it54/UTpAk0vFOu
         oN03MNBdr3Uh7nMtz9gRp/Uo5idHLu4wjadR99H/ArdkjYBw/HcmyNp38tQ7XXACXvAn
         7LxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AnEwnvhKln/QqudtDrsLeq9rcJ9ha/C6wjXnDVo990k=;
        b=z53xhBNSjTB4UAt4LWsehNGV9odT6crYhgnNPpLjN72Ey4BI+lZeH9xb+zw1OSfUba
         vIJ4Ve0CFs0WBeiKO3MpgvgUYj8obtLofStNKDrLx5zAO4xb6E3kxjuXFaOdUGhpaUF+
         RQzFRp3XEqDnGFRuF2m/Lv6A9LCE3O0WKS/p10e3fUDhozLNV9boApZM5labAZ23n++L
         47V3f2hJq+cIC2VN6HZo6g5Y4Cb1OT5C3Ni7F5iyiJa3+0B3KdSH0Qs5vvwgH77wDQ0V
         paecvUJaphOUR+ozXgsdk4rvognmy622KoXGoubXHGl+qDo8rC66kXCvljxQqd1QYmsA
         3J1A==
X-Gm-Message-State: AOAM532GPbWOx66i3TsU6xq7flzS9LetxY3CFlFnYbjLkklP+3JNBxQb
	i3iYuAJxx8s9WMHRe0l/EUheow==
X-Google-Smtp-Source: ABdhPJxU0QeXD6emlDZWLebUbtElcVEEa6zD5/lvXQQQBtACmvvZZjPEOav+NOjy2nN8XnxEigbRJQ==
X-Received: by 2002:a05:651c:158b:b0:250:a056:7e48 with SMTP id h11-20020a05651c158b00b00250a0567e48mr4800506ljq.64.1653029116920;
        Thu, 19 May 2022 23:45:16 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y22-20020a2e95d6000000b0024f3d1dae8esm197255ljh.22.2022.05.19.23.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 23:45:16 -0700 (PDT)
Message-ID: <cab52964-31d5-a545-9856-b298d3cd3c84@linaro.org>
Date: Fri, 20 May 2022 08:45:14 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 46/56] ASoC: samsung: Rename set_fmt_new back to set_fmt
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com,
 nicolas.ferre@microchip.com, nsaenz@kernel.org, shawnguo@kernel.org,
 linux-imx@nxp.com, cezary.rojewski@intel.com,
 pierre-louis.bossart@linux.intel.com, linux-mips@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 daniel@zonque.org, srinivas.kandagatla@linaro.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, peter.ujfalusi@gmail.com,
 jarkko.nikula@bitmer.com, heiko@sntech.de, jbrunet@baylibre.com,
 kernel@pengutronix.de, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <20220519154318.2153729-47-ckeepax@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220519154318.2153729-47-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/05/2022 17:43, Charles Keepax wrote:
> Now the core has been migrated across to the new direct clock
> specification we can move the drivers back to the normal set_fmt
> callback.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
