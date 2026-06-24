Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B3B2DB79F
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Jun 2026 11:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782301840; cv=none; b=l1W+YMMMEcJyK538UlPmZq0uGmwsAGOnQWdBzwX7UbDmGj+Zbej3z71n3uF8oPn0RZvdf9xdGDxWlPwkhZka9Oex42LleRfCfl3fdx6W+ieulGKbv1eCVcfAmyMXOfw/E5Lnj7/PgHUs9Sx9v3bjLJWy4p3CkqRp1Jf5hCiZQ9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782301840; c=relaxed/simple;
	bh=H9kzeArIrdtsSKoAfhoyLovvflrT2KaPvrL2Ox7o/8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9iJxBt3Dy+TSGXJZ9TkBP1CfSEOLTANjY/om/QULWW1D+jW/tIj5tHV1RDCgilN7ymvxxicfqjPdefkQpUvcG83rLWphL8D+hqHlayd+dWhYl8L859Gwn4St+KSxSAMSEIE3DxOrtQP2jYobWdIkFWdtuKmXx11rIKY+LZo1bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERk/Cf9O; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERk/Cf9O"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bec49f7e35eso147902066b.2
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Jun 2026 04:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782301837; x=1782906637; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eZbMotHgAD6jel0fNJNyUErzOCiB1TTJiURnxn+giCc=;
        b=ERk/Cf9OJPebj9ChMwMbo55wO+P810ihJGtxrnZWFczoWOPTY7lYaOQtijtq3qlYVC
         RetEV7W1d4VDCVrYuGNbGzheA9KkUrM4YyygjW8eXOox+rrfnjfiaUXuGwzShFFd9vUP
         NH5JSI9+WBMvM3Ubpqs4ipGsFYTsytxaKFBwmDOwSc7CiXsOc0SKpHtfOJBuIPiroZrP
         vJqEBUj2qojCkjuMD18O6pAjEQSBGSI04VkAIfPtgj+3GiFf8l8qtRyEHNUnrg2VluaA
         TI8lXeNsHM7SDj4EMQeuu36XVOy617MFT4usnylIVHHhlPqfXoVZI0WoWZSrN3F9StOT
         rJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782301837; x=1782906637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZbMotHgAD6jel0fNJNyUErzOCiB1TTJiURnxn+giCc=;
        b=b9UNg3C3XsMhgfgHgxmqtFdH/xeccGMJp9GNcmq2sUYV68Vl070TAsvwR2TgxJBA9G
         U3hYsJ5/tdPXsBCrSb6AbjbGsuniL7P8zdqsHe8UFh1wTM3mUSKPmlafG5og3F+BVAX7
         PdHFCNm99Vo4uwiY5RUVbhKEDSAsExdLfIXIWcHG1/qDUtpmvA8KuOo+fFoRc0nHklJp
         bYwYBL4nqOcsHpwG8rdc4r2ZCmi2pxcUjhY+Exs01smpPLsgGjec0CBMilC4eJ64iIB6
         BuiLyFDZMsY0vAlZq6Z434JGsCUUvWY+IrT11EYcljMj9wfCMKhSq6FMbiw6lcs5J8cZ
         RPSA==
X-Forwarded-Encrypted: i=1; AFNElJ9krdYXk+nnW9n4nSbeM7714fM+ZTjibLmX/R1b43+gUAL106BuSwXNyZegY6Embh3GDvqaN8vUmPDl9A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyS5t6+3G8cjL+/xqPfol/RwUJdcA5u6N5qphE+fNnQfbSVCnrz
	eH34L4X/H0VKaFhFB1SWlucJhA9pFF9zrsNiFfiGOkLeD9tnBvrmzeBf
X-Gm-Gg: AfdE7cmRuC5cNaoJsoPeK8TZT5ICT3+6QUb/SKBeV62fGptlSpxYUcW7T1tyUT3joa/
	zbiVOnf7j0uN7VOHqfRMI4FAiQLzp2bfE7Bo3Qp+EL0aKHfxZPMMGcjwbuF43A9LToJ9i3gqj+1
	WptpiG2cKX4N7/+cS3Gszw+NT6sFAgSn7iO8rlcrDIojJ/VUilouqM6vqqRABBDIAyFepoSe/ZN
	mEVfk19GK9lIvasld4cyT8wYqex/g1KEfcvIIRrOMKM2MDfOtb/DFxjtnl+iWaFEp5Kfv1fDTNN
	HhoCAQBHRvvgzFL0D1ZjZrYe9CpZfCDuhkHqdF9xLw02KxPdKM5cHYe83EZAS+tyKB2itsr77gM
	GHJsmymlWKv/7Nag0qoVumqiZqoF1E4qCS/XBAMK4UqlhMoIyfHKUl53Cygn3F75u33trjXBkty
	SzatIZyP9B
X-Received: by 2002:a17:907:9719:b0:c0d:8c04:92d0 with SMTP id a640c23a62f3a-c119f6127cdmr148307466b.49.1782301836889;
        Wed, 24 Jun 2026 04:50:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c6161f195sm656749866b.63.2026.06.24.04.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 04:50:36 -0700 (PDT)
Date: Wed, 24 Jun 2026 14:50:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Dawei Feng <dawei.feng@seu.edu.cn>
Cc: mripard@kernel.org, paulk@sys-base.io, mchehab@kernel.org,
	gregkh@linuxfoundation.org, wens@kernel.org,
	jernej.skrabec@gmail.com, samuel@sholland.org, hverkuil@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn,
	zilin@seu.edu.cn, stable@vger.kernel.org
Subject: Re: [PATCH] media: cedrus: fix memory leak in cedrus_init_ctrls()
Message-ID: <ajvEiDkI_CcXUz4_@stanley.mountain>
References: <20260624085920.578446-1-dawei.feng@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624085920.578446-1-dawei.feng@seu.edu.cn>

On Wed, Jun 24, 2026 at 04:59:20PM +0800, Dawei Feng wrote:
> In cedrus_init_ctrls(), the V4L2 control handler is initialized before
> allocating memory for ctx->ctrls. If this allocation fails, the function
> returns -ENOMEM without freeing the previously allocated handler
> resources, leading to a memory leak.
> 
> Fix this by calling v4l2_ctrl_handler_free() on the ctx->ctrls allocation
> failure path.
> 
> The bug was first flagged by an experimental analysis tool we are
> developing for kernel memory-management bugs while analyzing
> v6.13-rc1. The tool is still under development and is not yet publicly
> available. Manual inspection confirms that the bug is still
> present in v7.1.1.
> 
> An x86_64 allyesconfig build showed no new warnings. As we do not have an
> Allwinner SoC or board with a Cedrus VPU available to test with, no
> runtime testing was able to be performed.
> 
> Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
> ---

Looks good.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

