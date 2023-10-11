Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CC519BA7
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Oct 2023 09:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YRil8ZnS"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-32615eaa312so5978881f8f.2
        for <linux-sunxi@lists.linux.dev>; Wed, 11 Oct 2023 02:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697015029; x=1697619829; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FBdHg52RbcScFIWBis5JPCbs4EFwutNb74y5hFI3muk=;
        b=YRil8ZnSkHPfB1pju12YWE0fzwxuZ1sF5vWL3HNKPTKcNBebhHaWq3Y81oI1CJKRLn
         GD0H+rjkTss3BcjJ8GHb8uqp005fXJsCv8oWGHkz0FB+t8MI0DvaYC5z7zXDslOMp363
         bniy7ACDxiWNJjiZE4PKu9ng00kO2dc7fz7nbBJUYSXBHzRRlZng4Q2RoTEy3yUXXnaL
         MDeErQzMHfHlZ8+pK50CaWaKjIUvLWuuY+3KFji8KeNwziNTZdasEFSAGyg/otbGnsn/
         uNIHDq+1f+o6ChNlMjKfXCFm5vWWwScQYC/MqvuGJPajZcrvyRTWRNHN+xIgixUdi0js
         Dwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697015029; x=1697619829;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FBdHg52RbcScFIWBis5JPCbs4EFwutNb74y5hFI3muk=;
        b=TrhmqbWDOUZDEE+5l4kTB0mNlWX8gaZNNmX3/LnZQn8TyUgg2s/JmKtLrL4Gu0iSpY
         J7xdW2WUkDH9mVpozaEVOAS1hrrxnbJmShUV4qzXpGMzQkJ46kOx9eDFf/vUMDmJQYJo
         s5/0OYLVWpmruEYrKngZVS9i5YU4sPBHI90TmGEFyFAOdORJsn2B/zr7prpCfSifVg64
         DLKj69y8ArGhrrI1qPXO+jEDbEZdlztaoS6PjVInyx6quLwHfHz39jis16Tz2CQf1Y/L
         Gu2VPh/RYGPsbtxsQJwaqjpOFjmggXOYKHkXGWNoi3OOgY3cPqfWkym0O9KxU9kXRrf+
         7JoQ==
X-Gm-Message-State: AOJu0Yxy/LAq4MtMf39DOVi10NuaEaGVG6t5setFXZzAE5ZLE6aNnyI9
	iq3h/Omg4dVXUdcII9cu9RFd3g==
X-Google-Smtp-Source: AGHT+IHhC+dSe6ZgkjkRRcDm2jaYQvv0w9SRi0lllA0IR+H8hw0N/vi7sDbjg6OeQmo/Z+HXKoyvuA==
X-Received: by 2002:adf:cf0a:0:b0:321:6bed:1646 with SMTP id o10-20020adfcf0a000000b003216bed1646mr17841695wrj.14.1697015028906;
        Wed, 11 Oct 2023 02:03:48 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:de95:eca9:6b1e:b330? ([2a05:6e02:1041:c10:de95:eca9:6b1e:b330])
        by smtp.googlemail.com with ESMTPSA id d18-20020a5d5392000000b00326f5d0ce0asm14827181wrv.21.2023.10.11.02.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 02:03:48 -0700 (PDT)
Message-ID: <96da3e12-7d40-458e-9f65-05606dca201f@linaro.org>
Date: Wed, 11 Oct 2023 11:03:47 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] clocksource/drivers/sun5i: Remove surplus dev_err()
 when using platform_get_irq()
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, jernej.skrabec@gmail.com,
 samuel@sholland.org, wens@csie.org
Cc: tglx@linutronix.de, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20230831041414.66434-1-yang.lee@linux.alibaba.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230831041414.66434-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 31/08/2023 06:14, Yang Li wrote:
> There is no need to call the dev_err() function directly to print a
> custom message when handling an error from either the platform_get_irq()
> or platform_get_irq_byname() functions as both are going to display an
> appropriate error message in case of a failure.
> 
> ./drivers/clocksource/timer-sun5i.c:260:2-9: line 260 is redundant because platform_get_irq() already prints an error
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

