Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085C310F9
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Jan 2023 10:40:40 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so10585735wms.2
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Jan 2023 02:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ONRQWHI/sQIqG+xHe0N/n0K7DYmBUbJ5AAwVm+d+N0U=;
        b=wBlVF7aSvrGHLIvg+pYRaOcWCQwIgDJqjFp34W2AfthOXaBEZZ/08D1E0a7Nt2YVVV
         6vSq1r2omrSM3rXnFtBU9wv/+tvKhkV0Q/JVgvvlkHVJtlRPlbxhhcZxa14oUX5yjBA1
         DQi8Jyyc9o+Q2IoyYI7HVB3vRjGh60/ccBGd3iORuIJSfScenzj8OhlFVPUxcg7wGDqg
         qyDS31qPt8MeCZz6gy0QIU2n7/WC4rsL3TkCX6sXtUvpi3EX5VtnhsglK/J5hK/uKCaJ
         X29Qb3IbsfcSBkwwShocHdZ5EWZaYxeqNnNAu+LASt8nqCQuRCJZk9lNvkSh3UFtXogl
         I5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ONRQWHI/sQIqG+xHe0N/n0K7DYmBUbJ5AAwVm+d+N0U=;
        b=C3Ewoa5v+hYcyoJJS2fusROfTUAS008BoFd2RBMv/TVcavMsFjLVhYfqjy09ptemc6
         Zzr3dI40KJneWj6pvDY8sVAkJLbo0/1mOFa8bzuC+wpMNLFL63YY7JmnBMxGOeQ2KBBL
         p5TuC64AdpcPakFfbqlwRmeDIjELZVWvK90rqkkeMYMHbGazgtIf77xm3IMOkjxIlRRo
         oBbpGO2YrR/Ah780nBwheQXR2NcKuQoMyEqcS/G9RPvC26vhq6JraVzLAv5kIlX2WIrj
         TlSg+V9He5o9qDldLDMNFmLFOsXibzcgHxMlTljpsvKUE8x4MZWEu4+z2/Cm2IvBzDjY
         JJtQ==
X-Gm-Message-State: AFqh2kqREPi4fkNz0dzosYO9J2nsYBupaI86QPW4aI9J2ideIH96YJ9V
	NqTSYzSfWv8MgNDRg6lxG2guEQ==
X-Google-Smtp-Source: AMrXdXvpqy013YLOhxcVEo64Ir3FVYX+WtS52ey29R9L7EdcjNlgq4mifaFxyfxuXLfuh5tMHiqBjw==
X-Received: by 2002:a05:600c:1e1f:b0:3db:2063:425d with SMTP id ay31-20020a05600c1e1f00b003db2063425dmr19422209wmb.2.1674556839190;
        Tue, 24 Jan 2023 02:40:39 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id l14-20020a05600c2cce00b003cf71b1f66csm1844294wmc.0.2023.01.24.02.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 02:40:38 -0800 (PST)
Message-ID: <5e3b1cb5-bfe0-e4ed-5de6-c251b061d4b3@linaro.org>
Date: Tue, 24 Jan 2023 11:40:37 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] thermal: sun8i: convert to use macro
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, anarsoul@gmail.com,
 tiny.windzz@gmail.com, rafael@kernel.org, amitk@kernel.org,
 rui.zhang@intel.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230123102319.37710-1-frank.li@vivo.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230123102319.37710-1-frank.li@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/01/2023 11:23, Yangtao Li wrote:
> Use TEMP_CALIB_MASK macro instead of raw number.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

