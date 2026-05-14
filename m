Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5A518872A
	for <linux-sunxi@lists.linux.dev>; Thu, 14 May 2026 21:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778793432; cv=none; b=YfbWJHvYnmbia5MhflvhU/bV7k1DimGwKFb5nZhAtnx8HMpx0M/m50zPNf3jrY+wKRG+zIBOUMpZIqXVjTOkL1uJL4Nu+0+/xJ1WFUgAjyRJq5L1FejE8YC7t3v1f11DdQMbxXZZYddTEx5+nfmfAzNJYU4AEneCaEMqisyER9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778793432; c=relaxed/simple;
	bh=f374yOOteT1lhWHVc3xDSLLUiTmrQ+/1duYD3PPrNr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozari8KiIiScy+Z3/F2bX91AjiouSEBL0gT6fhV9X6nzBa4OJpg5c0FpYKzFK2uNFGIJ9bxshA6tV6Jy0AqxGsc5TwkJTx/mKJw81qEZ/vLMGSEzAjSRwf9uo9pzvsQjQrG+QC0XOk/KZkmcCA0tEWWqtGzyRCs33s+CkQr97A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtKtp86a; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtKtp86a"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-453903ee4adso7249335f8f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 14 May 2026 14:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778793430; x=1779398230; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HmU2QdCe85bILypWHefyZFVcWWsKYpG1noJcgT8vi7w=;
        b=jtKtp86aUVery+F1084tURM1oOz81e3KtgQCnkEMNOW84K6J/wvbQItuLYS+b2xgIX
         d5ZLLuyb+CDEkQ+rXKDO/V/fp4HYBEqu0AZ/6UynZPQ8y1p2B5kC9VvvClF0/72IhRfs
         INv53aNYsX696rNSBaMfqRMffkfHlAbj0FXXf7y2SLd/No2f44RiIB3GBAPg8F2UW3Rm
         SqukOq4LFr1uC0KkwUK5a8nHeXcTCZsqHrWVd6AHvTY/Ihzmrpq7NNJK6sIVaE7fCVnQ
         SK0S85GnnlW3zqvMTJRGeBq2w/Xg9AHuDo9gw4S8dpRk1ccFzk6jrg/lG4r5Svjs3JIv
         l52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778793430; x=1779398230;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmU2QdCe85bILypWHefyZFVcWWsKYpG1noJcgT8vi7w=;
        b=ChneiT0W7e5DWRzu5P1ldlvIbZ+p3BFEo5qDGT+rJgG3yN7joOw0LjbUqzGIVYbHwM
         PK3oIKep3FIYei66ACcFCr9RtsQaZlU2VDOUUqyBDo/XPkohT8dxxqiO7enFwasCa11Q
         Ata5bzGUUMV6gJ1tXSwZf/AAGKFuJQN84jW9jCNRMTvrUaGpyXmZm/m+iACLkbvsjUtU
         qFSiXN1p7LHUO8G1v+0GRGcuYcQjAFZiXmzBu4wt7KRHZrrf+RDMGHJktDhIKYns5jJD
         +yatzoHsF5N6PFNnBngkRL+0+rQC26+mAI/k6n7isADMta3h7T9VtctZPmtEWdYB6tPj
         ndkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+dQpqUpvBhYYD/OvHfVqlV9xGKC2fAaxXk1uKhCYhdLgKXemZDiBvNHPgPIkfc31OSghGeaRVHIgUYA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3+8VeZwbO0dXAGVhgJ2cIDTtkVerhtYgjr1xRkwxJ3CWn2+o6
	MGunQ9xnr5oZCfRObqkaCqXhfeXyNCL0KPQh5a6Qi3g+449zw40Ewysa4rXoWg==
X-Gm-Gg: Acq92OGNymtMQW6F8bQghvr5EtWxAf33ESSDxiO81d32eALaOR18Lq8Ml/GT7BsRTND
	FJbiY2PMpbbP6oOtP/LA37PO1LhIXnn+JQXjrF+927Qn2CjgybYJPmLHdymBO4vWIbFhP0lelKw
	6+WxvP4+y3iv3b2gCQzrit+Mzb71jHSi86X8NzEnHdpMq3E2D4lBmkkDKjEIMQ9HMK5h5dcY1+O
	4SEjdkyHpJv3Lfv3f8rtpwoC86CQ4QNRKKmT+Gnvo7XBuhj6H6yWVALTrm3wwuqsNfqnJkrFoVp
	OittQoL/ePBI9TVF0cmEq17zCyJzPpZXQUa4I3QVbco/9nH8i4By9rbg+uWEKE+RJGFSWIcqf2a
	38zob+ufOXnPhb4PRSDR8pIRuRKKzS+jzCqoB/ZR3g1b4yZjEsDkY8+6DFhWg7nJ9hdrWtiQrw3
	yg3UxLU+1t+YyDsZTcte8g1Y1lXfA=
X-Received: by 2002:a5d:5d0e:0:b0:449:fb9e:4b4e with SMTP id ffacd0b85a97d-45e5c36755dmr965484f8f.15.1778793429319;
        Thu, 14 May 2026 14:17:09 -0700 (PDT)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm9290771f8f.5.2026.05.14.14.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 14:17:08 -0700 (PDT)
Date: Fri, 15 May 2026 00:17:07 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: sunxi-rsb: Always check register address validity
Message-ID: <agY70wRwrkdI2pk4@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20260301144939.1832806-1-andrej.skvortzov@gmail.com>
 <CAGb2v64PvGdViT6DWHiNGoK=5L8DpfjVAdv+LbNf_Uisy6v0Aw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v64PvGdViT6DWHiNGoK=5L8DpfjVAdv+LbNf_Uisy6v0Aw@mail.gmail.com>


On 26-03-14 15:33, Chen-Yu Tsai wrote:
> On Sun, Mar 1, 2026 at 10:50 PM Andrey Skvortsov
> <andrej.skvortzov@gmail.com> wrote:
> >
> > From: Samuel Holland <samuel@sholland.org>
> >
> > The register address was already validated for read operations in
> > regmap_sunxi_rsb_reg_read before being truncated to a u8. Write operations
> > have the same set of possible addresses, and the address is being truncated
> > from u32 to u8 here as well, so the same check is needed.
> >
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> 
> Should probably have:
> 
> Fixes: d787dcdb9c8f ("bus: sunxi-rsb: Add driver for Allwinner Reduced
> Serial Bus")
> 
> I will added (via b4) when applying.
> 
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

Hi,

do I need to update and resend this patch?

-- 
Best regards,
Andrey Skvortsov
