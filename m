Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F601859
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Jan 2023 20:52:14 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id c17so9814464edj.13
        for <linux-sunxi@lists.linux.dev>; Sun, 08 Jan 2023 12:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/W1ZH7okdp3bC5pjHi5v6nQazt9WUGWbkW62SJcD8hQ=;
        b=CZSi5VCe45fYPvoueF3Xz9/2f8RQXo4zyAt34wYxgvnxVuDjBRRzHICHSsCVFL9qvD
         y0k+0LPoVdQjSsrczYbF/yitqgcOmTgTpEhjZtjt3K0/vdqY5X6LE/vA8Fahyg8LBmDb
         JgHj7ZOPWTu5jVphQgd2X6yMgiB49QeVi3N0e+QyysPEGlgHC2MSxjtVjIIvUA/FAPRj
         S2/zFCg6UTJiLPOnA34xzSUTpD7z1bpfhFvFx175/mX+wgOxWh3adhrMU+ehQ0Yfx+qm
         4zBi2y/2PuqdbZfQq8N2IMW2hGoNSPkVsIURkr3reDhJWPsvh63lvhO3Fate3WhzcCbZ
         oqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/W1ZH7okdp3bC5pjHi5v6nQazt9WUGWbkW62SJcD8hQ=;
        b=3u5vnA+ffu0glCzS76VuTYPIzJSeY/Y/vVuDsBS+Sm3tVPwtdVEHI2+nEpwknPxmzb
         zrr+RGkeq59Cbs15zeZEVXCRNXLtJkzS9Izlj+oKAABZT4UDQ2BKvehtfPmCK88SRCE1
         R37Ym9gaY5yMx3XIS0kXErUlHXZVqpmLUDFC7dxGO5RYDJb3+LjaNG9GeCNADhsb8EuJ
         1Jjr2nF1YmGPPZcud9VGYN7EPfLmRCj3keV/JhGl2qNJkci8GokSEkmRfaft+VTuB8xW
         eHI6iq9/oyGU9ECcEgRkWCvgdGvTktEdQEv9Me2AYrke+9iQJhGbjmyGrMIofFtJInao
         W15A==
X-Gm-Message-State: AFqh2kp9z24R4jOz8VWmZrmwdrgqr9Cu4SxOW6tOjZzS55axVGv8oR9E
	SPbD7U0HIy7kmv5uT7BklaNX4Jj2qj2Gz1Hh
X-Google-Smtp-Source: AMrXdXthkxdR5S3Vx/C5pVKc8nmwQsnxhLxbv5FwkjZ/fyeqvLUsh+ZvJxXis6Q2Ef7PtQwkRWND5A==
X-Received: by 2002:a05:6402:104d:b0:486:ac69:b9e4 with SMTP id e13-20020a056402104d00b00486ac69b9e4mr36935941edu.4.1673211133033;
        Sun, 08 Jan 2023 12:52:13 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id k26-20020a508ada000000b00487fc51c532sm3016451edk.33.2023.01.08.12.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 12:52:12 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, stable@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 1/2] nvmem: sunxi_sid: Always use 32-bit MMIO reads
Date: Sun, 08 Jan 2023 21:52:11 +0100
Message-ID: <5829449.MhkbZ0Pkbq@jernej-laptop>
In-Reply-To: <20230101183316.43642-2-samuel@sholland.org>
References:
 <20230101183316.43642-1-samuel@sholland.org>
 <20230101183316.43642-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 01. januar 2023 ob 19:33:15 CET je Samuel Holland napisal(a):
> The SID SRAM on at least some SoCs (A64 and D1) returns different values
> when read with bus cycles narrower than 32 bits. This is not immediately
> obvious, because memcpy_fromio() uses word-size accesses as long as
> enough data is being copied.
> 
> The vendor driver always uses 32-bit MMIO reads, so do the same here.
> This is faster than the register-based method, which is currently used
> as a workaround on A64. And it fixes the values returned on D1, where
> the SRAM method was being used.
> 
> The special case for the last word is needed to maintain .word_size == 1
> for sysfs ABI compatibility, as noted previously in commit de2a3eaea552
> ("nvmem: sunxi_sid: Optimize register read-out method").
> 
> Cc: stable@vger.kernel.org
> Fixes: 07ae4fde9efa ("nvmem: sunxi_sid: Add support for D1 variant")
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


