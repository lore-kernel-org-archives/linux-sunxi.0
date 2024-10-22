Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E481C9ED6
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Oct 2024 20:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729630754; cv=none; b=ABSp36MwxjdqYhyCCBI6h3kYDRKbhQ1wd03SeZwTu/fTk9VvDp+GT8C0Fz4HB745lEuwhE/aJJeb8NWPLn1QyZHZVWbDpo3b/XQzPVb54HQ9/D04Y6z9cu898CV4cWvX25idCGgGH/+FusFwdp201R457y4t0MCRDu0o5ah/sY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729630754; c=relaxed/simple;
	bh=hYznU99Gz6lDB78306nnP2N0S1YYbOsW3FeJCrSQz88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gs7lz+P52l6C7Vo2PtsMKRn7orPNNYLHlJv42MXwuuk1Llrzyhx70jo85O/PdX7h/hQNpnKQvrLDQbMEtzAYmZabjbwOxJ7tWouHOtgMyQPx8f8kelWHiRJMMPCEwQGBZYcPRqxT8UhV4AY1hJ1mi0E6D9WdbfPB13I8IFN/JH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFepyhNW; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFepyhNW"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20cbb1cf324so53749025ad.0
        for <linux-sunxi@lists.linux.dev>; Tue, 22 Oct 2024 13:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729630752; x=1730235552; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rGcVubgeABd0/PmmPiE/7qXUdJE2sMJ6ZOzH8qpp0iI=;
        b=cFepyhNW0sUvhoyKHc2h8eftmTROdFDJsARMLS4S1CMu459+AJXTjmBmhQ9oyuHRzI
         p7f4A4x5sIvck8F3AuTnciSPnMjUuo6CAgZB/FJ0fCBqxRQbmcU2NRSNI2Ii1FJuarp2
         r0ThEo/ETGiJus3uWd8VAtsTcfgZ+lWPiM7xfPoX0Qka2hLz/yTXBqnn0p3V0d90AJ8H
         fyfUuyZbaiOgfAkjPz0dIc9UC8FCP4zU30yH6u4qokZTlT7PZU2YX1Qyu0rLTur+XvGD
         vLZpcmE27u+BCEKufAytJiU/iqMtV0zZLaRCwu90FA/uye93rX1WlSK5DtDvRBcgcNiV
         O8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729630752; x=1730235552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGcVubgeABd0/PmmPiE/7qXUdJE2sMJ6ZOzH8qpp0iI=;
        b=IoAMhaE0MTk+SCModmdGXBbPlxGosGQoLyGiM2B3x2FV/TJoqaU7/4nv+XJKumNSOw
         1sYbfCYlP7ZTjmb5BA3t+EQg3eLn68FJ/hCkE6tRl/by0Chx+kdK2pkHwSScFyy621ZJ
         k9XZWXdGCz6QcyA2we3TQILqXLXOj9UiTOi/AHBYZ7AAewNF8iP+OeTkM77YlFP/YQ/A
         iV+FEDlDQXmjE7rcmi+5To8rjVFUzXEifvnLin965eU+VMnrJLy+RSamjoEfsnAEsqcn
         1QuTEnIKXlbD0H/nHRW6AjmcBSK7DTSsgEocET9mI1zTVytzz1go/o99GTetYaJfdyUK
         ZvVg==
X-Forwarded-Encrypted: i=1; AJvYcCXSuVsNHHU+WQHtNfHVk5Tmz+zs2G7Y96LU7T/nrgdUCLkyXU9tmEDEf0AcM92iL19G1F9YNPrqZFmAMg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/S5UgTxuq26pMUnvSrf6MsrkUH/iq0Cu1dNL3AMHvE493nkfq
	lvKCqMi1siAS0LAmXn5/Z1wn72og2W8/vi86WZB6ddmlBIznTm5o
X-Google-Smtp-Source: AGHT+IGJNU/cLwbWsuoQCsE3dJTP2JypH6Hr2f1MS7P2CbI5aJ0sG6TzIyW1dqVhAweQ4wLOdWoaaQ==
X-Received: by 2002:a17:903:2312:b0:20c:ceb4:aa7f with SMTP id d9443c01a7336-20fa9e298c1mr6239915ad.11.1729630750519;
        Tue, 22 Oct 2024 13:59:10 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:94ec:f4e5:1552:e2cc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0c0e2dsm46581055ad.123.2024.10.22.13.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 13:59:10 -0700 (PDT)
Date: Tue, 22 Oct 2024 13:59:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/2] input: automate of_node_put() calls for
 device_node
Message-ID: <ZxgSG55LUbw08mp8@google.com>
References: <20241021-input_automate_of_node_put-v3-0-cc73f636e1bc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021-input_automate_of_node_put-v3-0-cc73f636e1bc@gmail.com>

On Mon, Oct 21, 2024 at 10:28:22PM +0200, Javier Carrasco wrote:
> The first patch of the series provides device managed memory, which
> simplifies bbc_bee_probe() and removes the need for the goto
> instructions That also prepares the function for the second patch where
> the cleanup attribute is used for 'dp'.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied the series, thank you.

-- 
Dmitry
