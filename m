Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8363C197E
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jul 2026 21:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784583228; cv=none; b=TmXNsvsVSk95t8N8PK2R+paVXvWm+VryW8u4o7b7bGXW9WnQl6j8r8/jCy2vmYmiQL7VFDOSfVsf3xcWwC2oKe4NFSfGZu9eJmL1nAsHbRE5VeD+2xGsDI2l8O3Mzj2m1dbxFNr70OSxwTR8Csy9LD3pmsVfSk5/5jBSDKYeIB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784583228; c=relaxed/simple;
	bh=44idU8XRPllgsta208T3pPheGd2tESHEjmpM2ssCfH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvYLidpscQqMYH+V7SMDdddPBR66Bxpps2S4MWnAocEEq1tmnxZGrmPrYZACPxQbXRcwS3ga6OcYQ5/TslQB/P/+PJTvuHwgI15+Y+AQ2aE58uaGhri8r/KC4GK1MzW2SfQBCrniDdIZV1dWFkXZpUwcnKQfzaA0iiejipXls2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6DnIcgB; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6DnIcgB"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81eff3ddba4so31892527b3.3
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jul 2026 14:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784583226; x=1785188026; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=usAr8RVI0THAJ8XIFOJ4ZxGvrwrm2FlwhEayG2wImz0=;
        b=B6DnIcgBVBXGp7bv+j/PyyTTNXenGLHj/n0WqxIVI6ZuM8FWtwoTGBR9vAxKWx2PSH
         /NVwZ7ETkPoQhyvuOjth2e1+H67aUnLgr+w/0gfIIOXPi+0qxPe4Uvp087axkOHEYiAQ
         zYNf2RG7ei4rpYaRGvHUntsJ5+KTJq5MLT9neAbB9ufi1wU9/AXPje1tSXpXuRb/qLJm
         Rvoa2YqnJNTPjsHMgvyNP+dHT71lFXjZ07s87yphecbJvefz3igAH9peLoadRBC67xuz
         tuYSNhao/TO/YGyYTFQ/IqCER5APfAixAsZMbAzXZ8wo1Af5E6OBMb13nopBQK4T2Ydr
         tI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784583226; x=1785188026;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=usAr8RVI0THAJ8XIFOJ4ZxGvrwrm2FlwhEayG2wImz0=;
        b=F1EXletO9oTR/unTUTs3lvhiwTd8ysApNHOEQrNprdWORdl7S0wJyxICc07QugAnWK
         k2RUdNh3mZiG4wNaEvMz04A96cN1YK+nURnujMcdBF283NkSd7SyUPLpS3ZnGYg1XnHs
         GAhvN9CY0TwLYIOPXdG7O2LeEfLtau84gR7Thb+tCSVjzRxpDgOml1h+pAMcDcaS1v7T
         QwmNdIePw56gs+MVBhSOXVYeX+/dbk23GAixYZAWe524t8k08Rx+w6CxXMjJttTQJE/j
         RpMTD7Jn42ZDsjxFQkiWG2neqcVTzw1JrlIPL6j6lgXeOJjEHsHvI8ynCkjdbWu8yoLo
         jqeg==
X-Forwarded-Encrypted: i=1; AHgh+RrzxoBorOBIRlOLvBQegkHUM6Ui2XaIwFNpVTEAfPrfO+RJEViXATlEQN0si0nulpNCB+E4kAiZKwxqDg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVvd5/vdGYGWvInbM6Ow02fZx2SltVJQLK7Wbblbu8JGQQc+vv
	Yyiyp3hcwVXHqs+MR3WlmsbGl2efqoU+FaWSig+yqcJfLr67dqCE04OY
X-Gm-Gg: AR+sD11FWzCXJk66hdBnbVxtQPLQuftuApHnrOLOVZzJIDFOweJRt4xF1ActvSZeMNM
	qwDSwgQ03QBU0oKdji4EpJr/UsEFFVdLET+DZeIFmcU/D4F6ct4tjoVYHNJdHAdnuvXcu0psN5O
	72hUxcD1MCCGtC35Rt/pSazhwao7vyY4k1Vc0iR/j+BlHCWAaDbODkNoQEC8oD1EY5Xbjzyp94d
	rTn8ymx2sH5iVkGtfaIeDvRhehOJNndWjJ0j9m4JXcsXgZJjDl2Ufj93+DBd+QSCqjFVm/N9ttS
	rQbsBS5w9u9dbKAfRwv/wx9Xtk1CMG0vvO2E+MIyg/M7bXb6z4gzw7ZhK6rqrYHxVHEfMeUFW7e
	Spq+EH0nwFeGL9OklJDG1f/O5ltAXZQ8Jfml5Lu6jYlLFWrpZ4eQKo4Jo+r8m5NdgDHrJMb83Ye
	TVZXs1FcMzry7nJiyr2y3h7diHq3RFMi9/NxD5sQMXXXaHmvw=
X-Received: by 2002:a05:690c:6607:b0:81e:d032:f3c8 with SMTP id 00721157ae682-81ef26a5baemr53618927b3.37.1784583225589;
        Mon, 20 Jul 2026 14:33:45 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:50af:ea84:8387:c8b5])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ef406700csm56746327b3.22.2026.07.20.14.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:33:45 -0700 (PDT)
Date: Mon, 20 Jul 2026 17:33:44 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 0/4] media: rc: sunxi-cir: support the A523/H728/T527 IR
 receiver
Message-ID: <al6TyVD2EO3MxHY1@zenbox>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
 <20260720225310.039aca2e@ryzen.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720225310.039aca2e@ryzen.lan>

On Mon, Jul 20, 2026 at 10:53:10PM +0200, Andre Przywara wrote:
> On Thu,  2 Jul 2026 17:47:46 -0400
> Justin Suess <utilityemal77@gmail.com> wrote:
> 
> Hey Justin,
> 
> > This series adds support for the CIR receiver found in the Allwinner
> > A523/T527/H728 family (sun55i). The only board in this family that I
> 
> will you be able to send a v2 with the fixes we discussed in this
> thread? No driver changes, just the binding for the new specific
> compatible string, and the DT changes.
> I tested this on the X96QPro+, and also managed to enable IR operation
> on the Avaota board, where it uses the other IP instance (and another
> pin).
> 
> Please let us know if you can send a new version this week still, to
> possibly allow a v7.3 merge. Happy to review that quickly then.
> If not, please drop me a note, I can then take care of that.
>
Gotcha should be no problem! Sorry I was working on some other patches
for a bit and was out of town and didn't have access to the hardware.

I'll get the board out of my closet and do some testing before I send...

Justin
> Cheers,
> Andre
> 
