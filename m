Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB863C26
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Jul 2022 14:42:30 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id e15so21195049wro.5
        for <linux-sunxi@lists.linux.dev>; Wed, 20 Jul 2022 07:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4yQPkEDwmQ6fY2iybkkwsInOBKjeMVTN1PcfvnBQKzo=;
        b=pRXqu2oIYMA1vWokaOPCwKcrVUSXNmwiKNKzrT/ZJhIuvfD3uCnbgNmkKar7aVuj90
         x8E0rgiN4OFH5o56fJJ78Q4iXwNo7uB7uGeqowrDvvpeOalDH86VWUQbnDR46CN6QBW0
         y2EhbfF1W2SzJ2GSGikx9bF+yzcwc4WAwXWyjRdjtGA4pcMAlEVu4mIh/i9M/iDN4918
         p+/3imvrstXEpHPGXDM0uPXC3NZr/RNSNvT5Fe0uTW5lA5ECIGEOYbaGuJIxHcrbkVft
         zVZqJLANIDOXrHMb0/G9WRK1pcFeOgalD1PUBOfbYITLvgVnN8tnYBGEgSbnXikhmPRd
         cJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4yQPkEDwmQ6fY2iybkkwsInOBKjeMVTN1PcfvnBQKzo=;
        b=alMJxNgH1iXT+VNC94naWjyuiNCMdvE8efn66hTFkjpZkmxGx7O2IarIJ1uA3HXEGL
         3C3bvlZvyIiM7YtRab5lqguoDt4LCJq+mDOB+II+sQxBMIYZP3AqNeztVZU8Tk0SgyAJ
         6XfNVc5FNJKKH648ukpAayuHEO5uKSOEYF7g2CODxZaxgVcAaSH+ebs9248bMk1offSw
         VCg26p/M8GzvLPvCbp/XIOQ1ddzojpFzAXlxeZ34bOfT7kjScvxyDsn6SQ22Z0KIik7S
         XVf4lJHGxbb+cMiPYjS5aClk1nKtCHQX/cxp1F9syf79YTd83NTIGo3910R3oE+DUSy4
         FkSw==
X-Gm-Message-State: AJIora/LbbPglFr/NBbmN69vu7SftN6+Tkypbh98YuSJO/u5F9w8Ya5v
	qcOewZJlB0ZODuWyvlqHKjR+/A==
X-Google-Smtp-Source: AGRyM1vSAU4Vq87yHXgIdRiCpZq90qfgO2OmqyTn7r5WFUepyZ3vi981pLtyTOD1B4FfEwsijPJQBQ==
X-Received: by 2002:a05:6000:1548:b0:21d:acfc:29f5 with SMTP id 8-20020a056000154800b0021dacfc29f5mr29917158wry.520.1658328148617;
        Wed, 20 Jul 2022 07:42:28 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:5c9a:ee80:52f5:6a1? ([2a05:6e02:1041:c10:5c9a:ee80:52f5:6a1])
        by smtp.googlemail.com with ESMTPSA id l18-20020a05600c1d1200b003a04d19dab3sm8169634wms.3.2022.07.20.07.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 07:42:28 -0700 (PDT)
Message-ID: <9403166d-4960-29e3-1de1-9d17c76752c6@linaro.org>
Date: Wed, 20 Jul 2022 16:42:26 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/1] clocksource/drivers/sun4i: remove unnecessary (void*)
 conversions
Content-Language: en-US
To: XU pengfei <xupengfei@nfschina.com>, tglx@linutronix.de, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20220720020735.3771-1-xupengfei@nfschina.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220720020735.3771-1-xupengfei@nfschina.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/07/2022 04:07, XU pengfei wrote:
> remove unnecessary void* type casting.
> 
> Signed-off-by: XU pengfei <xupengfei@nfschina.com>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
