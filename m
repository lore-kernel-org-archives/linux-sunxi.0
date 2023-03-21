Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151406FA5
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Mar 2023 08:21:26 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id r11so56429326edd.5
        for <linux-sunxi@lists.linux.dev>; Tue, 21 Mar 2023 01:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679386885;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4gU5Ul5Pqtj2Zu4ilRhyv356GMLxKXORyaaNIGSfEx4=;
        b=KCVpYwy5GslZcg2w/pnsd8XD8fl9oI4gTI7eu3h/7VXuqpW8TQdXNDAK+sPofcAMdl
         ycbY9Xr/ULZro8rx4v9I3OHqiWPEUuAMOvfc2ZyO39n8Zrbsiky3tXod+YDFqwsXWgC3
         S34BMx+RCcIQ9vdtol3bHFe6wb5qZ+7vjw052gIrZbJob9mArZMAiHiPax3LRCNw/xgS
         jZjPnQylzihCDnVoOw4tPskB7fZD8ZKLiWh6LEyly9tD9N3Qf1s8y+TqjFVXBP2AGm9q
         mL31sS6a0lGd7StHZXAe3czDWmrdc3pwltw6CGcsCP8GUZPrcJffasoCBbGwipL5+2/s
         U3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679386885;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4gU5Ul5Pqtj2Zu4ilRhyv356GMLxKXORyaaNIGSfEx4=;
        b=xbqxZpS0sCy4RlwrKixXfiqdgQRZwfotRoHVaOsvzXz+FmqNPjda1rnxYJsvaj6s0s
         lCef3CSOsrU+PY5nn0gl2SUPz6GZoQxf8obKRFCms9WGpXr+RzIRWHt43+Z3FKkx7Sxn
         BX4iz41ioB5BYv4IGySwvwwaNjS1OxhZdA4Xp4XfwRxXdediZ7+T2cv1l6SwwJ3zYRLI
         Nsbxnx/cqnXJ1KfWA03j9j/VcknV8LFz9tOFPXXyjBmTDjjaU9aw+FAsN8p2AgoppJIv
         BxA3zoh0dv4YrLp1cZfSnmxHGRKreVLwfeLubwZ/RJNd9dZMEWTGhug0ws9oR+zLXj14
         Aq5A==
X-Gm-Message-State: AO0yUKVWB3xQ71A1hhRPAVvehlVRYvka9aVxrP6ss7lMTq24JCH3bfCR
	iMkwpUck9jRzi81enMb8qu27nQ==
X-Google-Smtp-Source: AK7set+6Sf7lskRnCtVXZF0F+OgifgUKEDMmWXjnbQFKwSnk5FABspDdYivaIjgEpa8Ajasi1pfhJA==
X-Received: by 2002:a05:6402:55a:b0:4fa:ada1:796d with SMTP id i26-20020a056402055a00b004faada1796dmr2339969edx.10.1679386885235;
        Tue, 21 Mar 2023 01:21:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id s29-20020a50d49d000000b004fc2a75c6b3sm5865294edi.23.2023.03.21.01.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 01:21:24 -0700 (PDT)
Message-ID: <8b7816b0-1daa-1c49-6f9d-40769d228a39@linaro.org>
Date: Tue, 21 Mar 2023 09:21:22 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 20/28] media: platform: jpeg: always reference OF data
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Joe Tessler <jrt@google.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Wenyou Yang
 <wenyou.yang@microchip.com>, Bin Liu <bin.liu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Yong Deng <yong.deng@magewell.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Prabhakar
 <prabhakar.csengg@gmail.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org, oushixiong <oushixiong@kylinos.cn>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
 <20230312131318.351173-20-krzysztof.kozlowski@linaro.org>
 <86431868-488b-4a72-944b-231b6d0382b0@app.fastmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <86431868-488b-4a72-944b-231b6d0382b0@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/03/2023 09:11, Arnd Bergmann wrote:
> On Sun, Mar 12, 2023, at 14:13, Krzysztof Kozlowski wrote:
>> The driver can match only via the DT table so the table should be always
>> used and the of_match_ptr does not have any sense (this also allows ACPI
>> matching via PRP0001, even though it might not be relevant here).  This
>> also fixes !CONFIG_OF error:
>>
>>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1890:38: error: 
>> ‘mtk8195_jpegdec_drvdata’ defined but not used 
>> [-Werror=unused-const-variable=]
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> I see now that we both submitted the same patch, but now Hans

We as you and me? I cannot find your patch on lore:
https://lore.kernel.org/all/?q=f%3Aarnd%40arndb.de

> merged a worse fix [1] without a changelog text.
> 
>     Arnd
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=4ae47770d57bff01

Uh, I can rebase my patchset.

Best regards,
Krzysztof

