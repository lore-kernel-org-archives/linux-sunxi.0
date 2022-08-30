Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67727468F
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Aug 2022 18:11:08 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id p7so5506564lfu.3
        for <linux-sunxi@lists.linux.dev>; Tue, 30 Aug 2022 11:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=0jx9VNj/HcW0dooShctB6tlNBtRfv946EPoOPim3t0E=;
        b=IdHkGy3kZluHn+s1pCS1fWDIsltwMDgJ5SLNDPu4jLO5nDxOv7HtdjosNkKuyV0DmG
         eUVjPmcsRIc71d5lUiyCBv5yz5iwuKITxlkI2CCTrVITfLANq+620vJrpokgFTnjMf65
         PPqxsSS+0cG9/10Su2NyJ/PoPuhyRXxyjcg+WLJwi+0JwWn4830Atw3YAVd9seGZ8bBd
         pQb455HbnE8H9AyoNrefVsPmjpWDZYG8ji2B4reou+a4cddd1nX5+NK/Opneeh+VVpgv
         0tybYtY7AnI1k1Wc5+hDcL2lPd/zK924fpvX3KRBLJpdU13SX0L3NR2Wv2HkylcGhsWw
         6Kig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=0jx9VNj/HcW0dooShctB6tlNBtRfv946EPoOPim3t0E=;
        b=oCgwX9e10A33gDuky551tgCh4fMNLUSTdaLC2UOeucLgLezb/dwFLK0U//yHGTdSkj
         ZLM/cJRj/O/4Rxx+9FMwRKwts+Zw1gs5DxLP98rE42Cftny0TNQHl184IvNhk+po+5IF
         GhL86WABaBSIzGjyaCOgS69IL0gLpwV0WhysuQxKTp8/9efXLfatMTvp3eh5cBvjRWEd
         9lBceNs00Cms12TYh+HFmebQC6iXF1nAhJM16psHY0giYtYtywj0XPhCz268BWsPJm/r
         3wcV9U4Et/rACdkm0Pwxm0oubFh0ZeNOx4nV8aSy1lCYWQeKA9EDd9oP6hkRJ2uETLJF
         ebmw==
X-Gm-Message-State: ACgBeo1hxUD73VX2qcTmnVleH/RvYoL/7pVpTHi4WaUwZUXDvtDg+cq3
	QbHrhoBIpbEjuz7R4Kkrv/y+zQ==
X-Google-Smtp-Source: AA6agR4LS54/XWSxpR5JM4CrvVaGHIeYIc+KzFnzxBcHugfK4mmyTYOXAfXMhla6rcSZpaiqZFIh6g==
X-Received: by 2002:a05:6512:3503:b0:481:4470:4128 with SMTP id h3-20020a056512350300b0048144704128mr7794471lfs.303.1661883066495;
        Tue, 30 Aug 2022 11:11:06 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id o17-20020ac24e91000000b00492ef074fc1sm1683629lfr.183.2022.08.30.11.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 11:11:05 -0700 (PDT)
Message-ID: <ce096b36-b678-63e1-e98c-7549f3df357f@linaro.org>
Date: Tue, 30 Aug 2022 21:11:03 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v9 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings
 for DMIC controller
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Ban Tao <fengzheng923@gmail.com>, lgirdwood@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <1661872039-40174-1-git-send-email-fengzheng923@gmail.com>
 <25072fba-64e2-df11-c8f0-a274037141f0@linaro.org>
 <Yw5Qd7ZNPIc/o7+6@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yw5Qd7ZNPIc/o7+6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/08/2022 21:01, Mark Brown wrote:
> On Tue, Aug 30, 2022 at 08:35:09PM +0300, Krzysztof Kozlowski wrote:
>> On 30/08/2022 18:07, Ban Tao wrote:
>>> DT binding documentation for this new ASoC driver.
> 
>>> +properties:
>>> +  "#sound-dai-cells":
>>> +    const: 0
>>> +
>>> +  compatible:
>>> +    const: allwinner,sun50i-h6-dmic
> 
>> Put compatible first in the list of properties (also in required:).
> 
> Can the tooling be taught about this?

Probably could save me some time in writing reviews... Let me look.

Best regards,
Krzysztof
