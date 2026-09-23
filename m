Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFC849BD80
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 11:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162806; cv=pass; b=OLHvK61Xh/E+Q39zRMuRMCtLywxi/7j1yC+c5CRVLBchHwUOgNc/SJaLbKDK2M7rEk6C6WuQPGwzmW5qLMedsQwvnQUgYIKhJW2VBqSCxBcJcrmHqTqoDrx3ZGccC/7Jz26ZUl9mrFDwPocrc7yieyO3xCGh8xmBxjC4Oi3Uv+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162806; c=relaxed/simple;
	bh=YKh7bVY6JYW2EMiYmIgo1vZA3LIPcnqfDJbY/5X+7R0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K9Es7YliV18gOh657i16z3pJATiHVNaWtCaiDVcOb+0o/IVRBQmaMgXFp/yOCyTNIiBQl1znsaUxpYQck+yNvhV6zvW4WesOYmL9IByc9PT9RdeSRhnd9Xf8AqvFhYd4Q83TdhEJNqZ9DnWg67yaODWaOa+Bgte3zb3W4meCoWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGRwPkH2; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGRwPkH2"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-910537b51a0so6155746d6.3
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 04:26:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790162793; cv=none;
        d=google.com; s=arc-20260327;
        b=j+N5Hfi1ibAMcjROq3iU6Zj+l1EE2WRGTtm5uxmyeHhH2zNSdJYXfrwxeiaqTLWhL0
         CJQpgxW3SL1N3yKZEfc+0rIgjJUeCO3p3LgBq71oA1kVxJOLZh0g+tk/u8/saBuAr1xp
         100dKd1D+afEP+D3IFacpF8SWkCHIiOHAWBiSlAfdBa2VpZmleqa9E21MZJ0S6rgdtT5
         PwQHqW0JqWA4QzBP+w2DWKj3Lwd67iVpdovOp64wmLMPcAEd30aSWVzJjz+Pae0qg9eD
         BPc5N6AbZwHFKBp3Csv+kXxakm1iJ8rl7kzWota8QTQ1+EtlZVumto9duZCyEnoRJh5S
         vq6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YKh7bVY6JYW2EMiYmIgo1vZA3LIPcnqfDJbY/5X+7R0=;
        fh=4Y8j3r2fKY8VM5CjtRXOCFH+8tfNRSkgBH1IEcraTUk=;
        b=LtPvj2ZG7laAC7s4HBAcOtKH6WzrwlGMUFNLVGX+qbahpMhIYSOjDq11Bo95FiIa0U
         Jxga51GFelV27Uo1WEzglorp0xHJEWIY7n7RlqgOMDZ6pABAzFRg6TbzAxp28G2mHvsm
         O4MvW2b3m/vgtnj1xs+rIz7ITLwznxF+AFjmrZUL0kKHCsb8X0nwzltf8XBjoR2I+yKs
         vzeq4624jPl9OVtR1dZ4gTRHWdWDTudyzf+kZwNEVEhhFP90nAe6qgSXNMhZy3tbW/gd
         mk8/lz8jAs7DykHRJvNUdofMLE3r88mOrgm/pCRXOu+d/RHRZGmkhML51odKctxDOKrn
         yWcQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790162793; x=1790767593; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKh7bVY6JYW2EMiYmIgo1vZA3LIPcnqfDJbY/5X+7R0=;
        b=DGRwPkH202H2SefyOdFg+VPxgNk2HUtKZuw9oTbeOON8hTKt3pRqZP3TWTY/ViBld2
         Ux+GrIxIeLrzvgPXmKdo/wgeQnR3Q5DUd7Hn8ECYGKuXrytvcczn4OtcHTfCYE3TgRl8
         Nw5Eu74whgt0ZKZXVijzrr2nf7pFTff9XnfwYE9IACf8LeFQXXXlWfVsnJ2S9fZYt5gg
         t4kMj2l+8g4DZIbJoZ3VoaZ8ckeiBZft/9S5zJ8wvsezlUwDGu383/PGH6uictNfWy9l
         Iib7n2gh50+pLr66EM6wjVgJE4klW8SXtFfnX0Y+worChltY51xTWukix6thvcnNMC2J
         E5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162793; x=1790767593;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YKh7bVY6JYW2EMiYmIgo1vZA3LIPcnqfDJbY/5X+7R0=;
        b=BIsKQp4fY9k7lwM+wD/Bt69L2JMu4rpSYzXSFLDNyGaju3SCfnCnH0ZxUowB/mWArm
         /GnA2cLNYjIEs6xnckGCNtXf+Pi2JKfmxA3jc+mvrIGHscD4oUCShB7aun0v8DBaZtVG
         5GXmgNu7A413nU+zhlL7Nf9+1/yFriPuw+pNce/MOoxI2HMFOFuis/b5uzLuej6MzkuA
         UGzcX/NRhW2X+iFUgqxJevDhR2/YyOhccenHqQPEgBXp4EpXHIkjmpUKti5GZeaU+ZrK
         KOpx32APkbM88APvibYLSF9tC3fvd07Xp3OqosKKNUEpEZ0zXQ2nYJiVKfZReBWLDJC6
         Z+Hg==
X-Forwarded-Encrypted: i=1; AKwUvBzTX5NF288V/9jqqoWDiJGuufug3H8WIk7yM5D6Pa4mod2LWvqCMzOhs1zV3EkU1GvTW0gQ8HqP4eLPGw==@lists.linux.dev
X-Gm-Message-State: AFuF++l0dfUKINBWw4GGpxzW8kKEBpM+pCpZSnCBUd36IAX2o8EoUkRy
	CQnPFWPpL3QwOKPJXMZR+YP5t3mT9yILWJUTfDg6G0TcWDjmzgUofBmYoHGUXxH/xp2bbovH2cc
	qt12risJYeR7KVTuuteTvFpPG7xC3tkA=
X-Gm-Gg: AYBFou37gsHITaU3CTT4VK7VgkAfe1h/+kvMiHYUwLT35O4Q0ajFziv182QsAeGA0yU
	s7mywLTpS5fOmpzHWAmC0jxR7qoeyYoQy36+7PxBER9+LnkrzLAFFkX7kbsZhZAVaqZDlBq+fgU
	yuAuQwIY8o207IvgH6MVbVswmJauNV1+kC6L16YWyRxSaKbu9oOAD+M2Ql01gasmXehXewrRYxp
	cXVYGNUlLLcxJQ53dCNz3kSrR/RO3UHJ3NKQoGGbt5BjsTJgX3xzP1bb9GiiQg4YovsvLXK0G8n
	AYdcuPIKfLnMiZ+6ObVp6//uhAW21IDuT9EW03THsnMrPT2gwKb7N07RSw==
X-Received: by 2002:a05:6214:4b0e:b0:912:3c52:5e72 with SMTP id
 6a1803df08f44-9140c1b4422mr39057966d6.0.1790162792723; Wed, 23 Sep 2026
 04:26:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923105215.1633-1-anykey196@gmail.com> <20260923110236.CA7FB1F000FF@smtp.kernel.org>
In-Reply-To: <20260923110236.CA7FB1F000FF@smtp.kernel.org>
From: =?UTF-8?B?0JLQu9Cw0LQg0KHQktCd?= <anykey196@gmail.com>
Date: Wed, 23 Sep 2026 16:26:21 +0500
X-Gm-Features: AclHuK9metqHwgNkcVEJzrqMbgwYmoN8PIfNcC97UYtxIwR3y1ghSLpIZWCE-9k
Message-ID: <CANHPwAQh_47zOmej2yo-kGPV41xWXqgUbWTZ=zjhFNL-0wengA@mail.gmail.com>
Subject: Re: [PATCH] Input: axp20x-pek - add AXP313a support
To: sashiko-reviews@lists.linux.dev
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Thanks. Correct: the AXP313a register map ends at AXP313A_IRQ_STATE
(0x21), so AXP20X_PEK_KEY (0x36) is unreachable and the
startup/shutdown sysfs files would always fail with -EIO.

v2 no longer reuses axp20x_info. The AXP313a gets its own axp313a_info
with no start-up/shutdown times, and those two attributes are hidden
via an is_visible() callback, so they are simply not created for this
variant.

Tested on: OrangePi Zero 2W (Allwinner H618 + AXP313a).
