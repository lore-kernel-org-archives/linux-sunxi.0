Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDE23E556B
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Apr 2026 13:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135375; cv=none; b=YyYNUXOG+UiGUjRIRR5IyN+V6NMtRhp7ashx4X1ncBhxY3npdilnIb+m6JfophmLvvjE1QB61xASMdd5reB3Dwjusc+oAhUPCOyOJfSv/ze4hI4rhTnFsKAv1TOcFZOGeyLBU6A9N3Ehx+lV6Z31FYI0GXXxE5Be4lEnSeSWwCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135375; c=relaxed/simple;
	bh=YzIB4Lu+zX+IE4ZJ+/9khtZjX6XzKpii2qvc0U32c3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8NGpr3DC7zUlZnfeLJ1zeue2d3f2kKMxxFh9Gx8L60iMYxLuPRohy/SsxLX55UL2CIiO059qpO50nf0uZQXtRPCu3wPuEJsq/JDI0valXhmhz/DNH8XhVBBhErWo8JnaSPRSna2U887/aozm7BL5xFJEjGjUcivR7shmVz5yj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cfl+ekIZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cfl+ekIZ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so5479575e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Apr 2026 06:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775135371; x=1775740171; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LBHNBVUFUCJBpW5DUWaq2VhnmG86vXoZK/pVSYZwtz0=;
        b=Cfl+ekIZfaZDPIm7ZXLBLOhQzFlJTzn/4WtWBl2YvA+NTzr8/Dcu5M763jla4uNUvZ
         Nq7ks6PTTvJiCGFO3ZQNP8BfbA5zdpZ/A6Lmf8pitD+m9R7idVDv/rMhvCB4JUNquBRO
         mx7sk3mTMi2ncPXPr8coq51NRb1L/X8qE5cox8+loKo6QFOj1Y37FRbhuTlE0kVsFye9
         4XaXyfLVWgqqSUWiSJjP/zTZivzBjdWrlUplB5MhO4N4N84wFCvgtPW0Fo+FsUZU2aIn
         7F7JJuD93Q8ZYkq7kuVxzrpKaN/8savFk5lPKFK8OYkEeTC6BvOKdCrkL0NBJl8oWaFM
         cQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775135371; x=1775740171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBHNBVUFUCJBpW5DUWaq2VhnmG86vXoZK/pVSYZwtz0=;
        b=so5sD29Q8zWa/dOT/qAiksBICyTpjQSiz5RLVTA9IiIhUggtuWPNlDn7M1oY1Q7vi7
         +43p/RqtOfBEp6kTRTxtBXZXSRag/iP9ScWMFCLRmQK5JajhiCTnCVEMh7qOKrFZzS+G
         0Ns9yHCGZVBfMAjnaN3n7G0fZdgoqknfHXhkoUL9JEg/Z41D2aw18cIkStGS1+xFr3lt
         NwFQ96/Fv0lpOMhrtaTC4sGKH/sJsZwoVvMqbb9wdJRAKW//cea0lFc07BzXIDo8pWcY
         IxVdhbyE8n14728A0dRkI9FTKmGsYjnmUvpQ547l+9pr7tAputyoQ4q+OoPde1V+TJmT
         gDXQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5Hi5oxi+FbZaynWlL1xtENKr5+nkuZLUsVcjL+qP58ca9J2oSw5wUfPs/5Rw/P7zl4rgAejI4SKzxYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YymFPBgTj+u0S911wZ8vG91fultHnOh5Qzt5paCYhTo0rjOZ7dh
	CWhsRpbzgaVNa1VnYPzZywxShkrGQ1nO6Eh+5TTQfx2RHcAfbK2dCJs1
X-Gm-Gg: ATEYQzzxQJqbsGEQ7LMPSXStkgxlIvqEKeM3bcaSxUlqLerp0+8T8pS9SSGb32czl8i
	ZqzXn5d3MZlfcN18Vfqj1eru7wxrG/y3/Dyrm2RfQz4pD47BCFTbUzzT0HjtxOevW0I1Q+wIf3Q
	IEp1io+oKWH7Z33qNlpV4HFhRSpLWA8hMJFQ3Dl+j1xOcQ/Ceh62zuEcA6B+Kxk5MVl+NA7hq99
	S/cA7XEfPUtiXLqkWQIG+SYK1u450s05Gx5Rt8CLKLuNpvB1pRb8RVVxVxk1JDB56MZ01unvb5v
	51Z3g8Jjnd9ia9QQ/9RATEddjTEx58MLgcilcyOv7yFoFbTk1KOd0cg3scEB5FMESdUWPnInUPV
	Nfj6hq24Def1YmEmbOUXUnMexq6FRJWFQ0FyUwOPAqOubAtVnM5+0vDWluHpCRW4UAA9N4RqbjE
	mgsQHy2AXzYQP2PmTAJtI=
X-Received: by 2002:a05:600d:11:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-4888355df72mr134713795e9.1.1775135371137;
        Thu, 02 Apr 2026 06:09:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e829c43sm175553955e9.5.2026.04.02.06.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 06:09:30 -0700 (PDT)
Date: Thu, 2 Apr 2026 16:09:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: cedrus: Fix missing cleanup in error path
Message-ID: <ac5qhwdZLNe628eW@stanley.mountain>
References: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>

On Wed, Apr 01, 2026 at 10:14:40PM +0300, Andrey Skvortsov wrote:
> From: Samuel Holland <samuel@sholland.org>
> 
> From: Samuel Holland <samuel@sholland.org>
> 
> According to the documentation struct v4l2_fh has to be cleaned up with
> v4l2_fh_exit() before being freed. [1]
> 
> 1. https://docs.kernel.org/driver-api/media/v4l2-fh.html
> 

I wish the commit message would say what the use visible effect of the
bug is.  I looked at it and I don't think this patch hurts but I also
didn't necessarily see a that the original code had a user visible bug.

I read the documentation but it wasn't as unambiguous as I'd prefer.

But I'm not a subsystem expert.

regards,
dan carpenter

