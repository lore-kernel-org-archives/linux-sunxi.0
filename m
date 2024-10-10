Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3591C9ED0
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 13:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728567457; cv=none; b=BqW/PX4UHc1EjEASDdoU+Z5vk28OxfO13uVbD1uFfpM1Z8TYpJo79gOcdr+8068Bbz+dBzHxfWxgNkerIzlU/tm4QLY3pnlC3asYtKAadTNNqV1DUaJ2TPM4e/yxffrfyDUV+t7I51WyaJCS5ei3yOzwXr0EwMMo02igE6ldO7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728567457; c=relaxed/simple;
	bh=SIKjiEYlDDDOqLRf8TeBLmmvdWfnUp8Y2f7+7Cs8lGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3TyJ/DgWmD8BZVgFrKO5e5CYWHZJbgxRninoAXetSl5Sx3LNGy5c+Qe0yTaPPW28NiIc+u7vqf+MoMRad6xNZoj1d87kTbafFSjjGg2pP1BJCXPebZ8lxSTzbxZDRFR5ijq2KbjRDfw9y7whfDmFHEIQknlHrT+1DZ2CHNRwjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53995380bb3so1197685e87.1
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 06:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728567452; x=1729172252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZzwzKkCp6jPszo6ZyDDEvEEJi7wd/je50oKdYYshjiU=;
        b=g49TiUNmotK+3EM1UnR9Qd2qrb66TkzW/7ADT6tWJDXy9K9DNyTCFLgMfIvzA1G5MA
         97l5cWJo/6O15t0qNgFxTQ7YFEwYShHOdnS4RTi3A/N0ruxCxncsSPis6dPjf9JL+r6w
         WGFbr2bfSRHXljvYMLYyGxnozgfiN3JLlEUGCgrjlmHxR5jeSUh9OOjvgguwAfs2RXcB
         E1Uk8JZwfbj9e89aQjZTeDVmJNguEjOmi2iMRxeWBMTPwz+k6QF5DJnLLGhjRG+ok6EY
         r9m6RfWfjT6PCJzYojKRKR/JD8og8+hGIhD1QZE8ddd0Q6mjJ/0AHYg+hSDNWb6sm8Ip
         nYWg==
X-Forwarded-Encrypted: i=1; AJvYcCW8UQK6wqu7lqOqxQnfuGUVytwDGuayGvFZ/ZTYX39c6O+mIbQJTtKLdAV/p3Jo3tZWXkeOUwhPSCrHNg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm6KLhoXmg4JQu9W6RXnOnCfRoOudHtS7MsUmkhXkbK3BxzxBn
	IGe501gNW8Jj9rzAD1eQUBXq0zuS0QhNoTAhaWsirOCI1mkWEN9AnH5MzSO+
X-Google-Smtp-Source: AGHT+IGQigoppa3Y/X7ew+JL9rsjQNVeuPWvAckPGHcNAGeF46SLT5ReyixrME5/mQn/i8ei56AhNA==
X-Received: by 2002:a05:6512:2822:b0:52f:413:7e8c with SMTP id 2adb3069b0e04-539c48989f7mr3582848e87.14.1728567451510;
        Thu, 10 Oct 2024 06:37:31 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb90547esm257614e87.265.2024.10.10.06.37.30
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 06:37:30 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2faccccbca7so7694521fa.2
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 06:37:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUnp9cM3UXYTqXe1G9WJ/bV3mEy5w52s0u7i6bJHF8ZbVM84vvyagE4tTNZe/qInIiNl2lQcCTl22kJ7Q==@lists.linux.dev
X-Received: by 2002:a2e:f19:0:b0:2fa:c57a:3b1c with SMTP id
 38308e7fff4ca-2fb1873eca8mr32339161fa.17.1728567450394; Thu, 10 Oct 2024
 06:37:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241010091355.8271-1-algonell@gmail.com>
In-Reply-To: <20241010091355.8271-1-algonell@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 10 Oct 2024 22:37:16 +0900
X-Gmail-Original-Message-ID: <CAGb2v64=WSCyKVyMtUv1d_WoLLnJjEx4WzC3mmF2uB+6O+0oZQ@mail.gmail.com>
Message-ID: <CAGb2v64=WSCyKVyMtUv1d_WoLLnJjEx4WzC3mmF2uB+6O+0oZQ@mail.gmail.com>
Subject: Re: [PATCH] phy: sun4i-usb: Fix a typo
To: Andrew Kreimer <algonell@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 6:14=E2=80=AFPM Andrew Kreimer <algonell@gmail.com>=
 wrote:
>
> Fix a typo in comments: wether -> whether.
>
> Signed-off-by: Andrew Kreimer <algonell@gmail.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  include/linux/phy/phy-sun4i-usb.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/phy/phy-sun4i-usb.h b/include/linux/phy/phy-su=
n4i-usb.h
> index 91eb755ee73b..f3e7b13608e4 100644
> --- a/include/linux/phy/phy-sun4i-usb.h
> +++ b/include/linux/phy/phy-sun4i-usb.h
> @@ -11,7 +11,7 @@
>  /**
>   * sun4i_usb_phy_set_squelch_detect() - Enable/disable squelch detect
>   * @phy: reference to a sun4i usb phy
> - * @enabled: wether to enable or disable squelch detect
> + * @enabled: whether to enable or disable squelch detect
>   */
>  void sun4i_usb_phy_set_squelch_detect(struct phy *phy, bool enabled);
>
> --
> 2.39.5
>
