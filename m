Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9456446
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Mar 2022 23:45:01 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id x5so719030edd.11
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Mar 2022 15:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:cc:references:subject
         :content-language:from:in-reply-to:content-transfer-encoding;
        bh=R5rD06Jb33tlpsYg+zacl9gOGE39RgYTcZ3AUmAKk+k=;
        b=kT0CoUpD6C3Xk+Syyc3g2EyRA6X+44nx9fnethcGlcRmfLBQpCmyre7xE3rkEC/Y1t
         STrq8nxvUWIMlu5tRsYNT16i802tLm/s3IyJRYk1bI2Pji3IVN7bLx7hyyfvCgTJitIy
         0+vQ8zJSa9Kbj2C1GGvbWbLCvbf1mMaHoiZlr/iSm9Xp3F1GJw1SB3m1Z2Al1R00X5Ne
         ibT8bT+jzYCECm9PLVzl145bqj7V9/GAo3/T9kdCmR/N4ksOT/UM/LVxLZa4iXVRb38J
         7a9ZtfrtSSJZ4ORPlySmANv/5Ig1MxehiFh0UVmL1aJv5jZtyFSLRccKYl490TDoCnWl
         cCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to:cc
         :references:subject:content-language:from:in-reply-to
         :content-transfer-encoding;
        bh=R5rD06Jb33tlpsYg+zacl9gOGE39RgYTcZ3AUmAKk+k=;
        b=3Q58lmpaEkR7ONjX40xh/03vLFHYx7pLZs2OaYopsQouV7FQeUboo3bXWrJgwIJ86b
         MdSc+++8IuUSTQkHMu+Ir8R9AIz71zium1E53EXSjAa6u7SiqqFqljMGbMC63bu9py5q
         Q1oAad4mntte8WJy4gcY6/9SKrTbW1wKo555Z+43xxaQyhhG3TTlCwZmB50FhOX9uA5y
         IUXs/yCPhjq61caW/4GuDC6eL1bPMRTDApwPRm+1TDJw9krQvuVBKF4WJWjtNxPwCLzn
         euaD6yLQB3hsxitOGekZJlwPD+98YaAD63TQq6xgQUXipEgfBRX0P4uIASy2D8v2y2W6
         sXfA==
X-Gm-Message-State: AOAM531nllERRdqaMF8bfSzcURIVv43FQ1ACVa6hLplDbwfZWVOs/c5N
	dIZFYKPgBCZqNpn+CEQsaTJw5A==
X-Google-Smtp-Source: ABdhPJwAa5h+FPbQ9EbtrO+8twaLOcIwcj6An3X7zE034ZrmYDx1nBgzQc3Ssz/Np+zl4LlJ6UlLlg==
X-Received: by 2002:a05:6402:354f:b0:416:8fba:8348 with SMTP id f15-20020a056402354f00b004168fba8348mr968136edd.73.1646783099315;
        Tue, 08 Mar 2022 15:44:59 -0800 (PST)
Received: from [192.168.0.103] ([37.252.93.155])
        by smtp.googlemail.com with ESMTPSA id fq6-20020a1709069d8600b006db088ca6d0sm74709ejc.126.2022.03.08.15.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 15:44:58 -0800 (PST)
Message-ID: <bc846d95-5571-cfd1-c848-1ae9240f50a4@wirenboard.com>
Date: Wed, 9 Mar 2022 02:44:56 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To: fuyao1697@cyg.com
Cc: devicetree@vger.kernel.org, jernej.skrabec@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, maijianzhang@allwinnertech.com,
 mripard@kernel.org, robh+dt@kernel.org, wens@csie.org
References: <YiCnR5v9fYoXXy39@scg>
Subject: Re: [PATCH] sunxi:dts: remove r40 can node
Content-Language: en-GB
From: Evgeny Boger <boger@wirenboard.com>
In-Reply-To: <YiCnR5v9fYoXXy39@scg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

as I explained in the original commit message, CAN is definitely there 
and is working perfectly at least on A40i.
I know it was removed from the user manual, but I personally verified 
that it is working.

Maybe you can tell why CAN should be removed besides not being described 
in the manual? Are there some hardware or maybe license issues?

Thanks!

--
  Best wishes,
  Evgeny Boger
  CTO @ wirenboard.com





