Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43301CCED2
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jan 2025 23:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737674046; cv=none; b=CREARrxT0nsm5L8Al+D2IUtiimU1Yl+AEHWE8CmhhdEy3bFU9V3zZXWkMbqnrhMC8U/NkKJukwIzaGNshJmByZwfE9HyrU2+sZvmTobTRl4FZo30a0MVI86shFwjFWVK49VkYK3t2QjU/hzWj7K+mi1sWCJtdhEax6mQtkLvaVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737674046; c=relaxed/simple;
	bh=XDyv0L4DxqUpsc0zMF7C6ePGFTGygasVD+WEnLIpSyA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hbhZOfXvCyn+pbPdtTJBmrCNNRW20KJUKXquYTGlJu1MVqwSLPoPUdTxmNFSyoge68V9jsuVXkxYJudn9hVQUaXnPCSbZzrshErGtheZbW5mGjSsDbiskh1rboEQ+rROszx6ZYRNzdS279Ry/AVLwTdwymOP5/Zdlr4l9ZFQ9wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=LH20wk0e; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="LH20wk0e"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4678664e22fso13000561cf.2
        for <linux-sunxi@lists.linux.dev>; Thu, 23 Jan 2025 15:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1737674043; x=1738278843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVTJ92/L2ETtgRoalxa67ZHtZkPrfv2/HOM3XSD04P4=;
        b=LH20wk0eXH1yR9fM9OC6RaiAKspNxQzMGwsdXrfPhnPDR9PNJV3FZ84BtlB5mWr2V3
         XilL71XJhxhjB71PZwzHN3Ii3GWnvUo2YzENGHhypXYlOi8hCeyCckObExZYHCDbO0fo
         1INfHMXKhLClCyFe2fCqYTTRJigvCNnU6F7o8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737674043; x=1738278843;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVTJ92/L2ETtgRoalxa67ZHtZkPrfv2/HOM3XSD04P4=;
        b=LAxcf+kjf9R5USKPkslIDEhzn/VxVfA6ky+G/MvQAu+Ic5dNc4I/KHQGLSf6i8qILU
         /kL16r8zLgOYKVY1t9TTCjY+DGNRRDQEzPs1Ui1mmn4coxOKcCB5PSiIuDw9QMcYwy0V
         9LITEy+kcreIfaxCax/5SA4M51HSU7Ult8atGyqKlCHwovEy5UxAgtOJ6iOR3ZfRHpe4
         LlhoAw/ScQFnau+7HSmfqqK6tGYmSlsusC1BTgHgGauyJ0OwGUaMxF0YMcqFmVeJzQo5
         Dr4SI/kYrI3R3L9AlZYg2RiGSCgh7UtbDHNHzQX43TQ6Monm7NNEa1sftMojPOR94Xzk
         M5Cg==
X-Forwarded-Encrypted: i=1; AJvYcCXfn9vDz79XmmreHTPGZiKHbsFbuanFcu+TC/S+IPD2+KItEr5SQIpAtDv5ssyJM5kXj/5/dI78FidBjg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNiuUyWkeA5UT82ZGguVmhBQgudU5Oo3jytdJ7EFo4JOfyfcdG
	M1xr0+3HIbqn4kmNp4ZrAFnNCaVh3J7DMmtzSc81GSOEbZhes1qlMRvtFhSKK53utXJqLBf9Y74
	dxYY=
X-Gm-Gg: ASbGncsehiRJmhFYHsOGLfCvXTHTwa5xH9fpC18psLRZK2WQ8CBadLqEfoPu/lfY4sU
	0HQayrkmW1Okyen8a4NKx9Xd8LlLeJNGPy4CDrBqpv3lLDS9iKkvkfkF/Nek4uDuLFQV34wAwdk
	5UrTdhMbQDVm8v7ig/erp+gP6BbojCLVl3obu5mqlbYC6pgGYYxbKGGsuriAwwKuuWXSO4QfTla
	yHcqjIftgy8ki3yyGPwjZAhOlOOyLK16fc0Jhc3uMnipLur8zkIykQ87CLfyHNNLfBxCc8dzQcb
	YV0=
X-Google-Smtp-Source: AGHT+IGbFq+BCixh/CgGMt+3GazPSMwhKc0B57MJibbtNX4K9H5MxPwUABTAThqUKqad/Z1Y46gg9g==
X-Received: by 2002:a05:622a:1446:b0:46d:d2b7:4bb5 with SMTP id d75a77b69052e-46e12a96f34mr438184881cf.28.1737674043594;
        Thu, 23 Jan 2025 15:14:03 -0800 (PST)
Received: from [127.0.1.1] ([189.177.145.20])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e66b89811sm3753441cf.77.2025.01.23.15.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 15:14:03 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Simon Glass <sjg@chromium.org>, 
 Andrey Skvortsov <andrej.skvortzov@gmail.com>, 
 Sumit Garg <sumit.garg@linaro.org>, u-boot@lists.denx.de, 
 linux-sunxi@lists.linux.dev
In-Reply-To: <20250123013620.23914-1-andre.przywara@arm.com>
References: <20250123013620.23914-1-andre.przywara@arm.com>
Subject: Re: Pull request: u-boot-sunxi/master for 2025.04
Message-Id: <173767404231.3025404.12787101956021701262.b4-ty@konsulko.com>
Date: Thu, 23 Jan 2025 17:14:02 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Thu, 23 Jan 2025 01:36:20 +0000, Andre Przywara wrote:

> please pull sunxi changes for this cycle:
> 
> Following the move of the H616 family to OF_UPSTREAM in the last cycle,
> now some older SoCs with identical DTs follow the lead: the F1C100s, A10,
> A10s, A13. The remaining SoCs suffer from that IRQ cells incompatiblity,
> breaking support for Linux < v5.13, so I am holding their move back still.
> 
> Otherwise we get proper support for the PinePhone v1.2, and PSTORE support
> for all revisions of that device.
> 
> [...]

Merged into u-boot/master, thanks!

-- 
Tom


