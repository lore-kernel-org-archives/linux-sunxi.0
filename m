Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF8432AAA0
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Mar 2026 20:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774643051; cv=pass; b=WlTUK0R1iuyKHi9HMtJvLcaM2gCGBecMsnXLysI/RrelwrozvS+EtrUcOoExEYjyXDtc2IC4Al0i5rs4EQIuI/hhKE/QVzTCOZlJZ9awUemcXXQu5RrzO6LqMX2TW1u5xTcw4fSlTE2rO7CGib33QqG4fD+BuDeT5/83WSNrtlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774643051; c=relaxed/simple;
	bh=fe8HYEgNDSZEJwtPnP9d7rdRK4mOuzWO1Arb10bM66I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yb6NcVfovtm+xS+fstGOiPLxB8KOZ968Ob9iE740ihXvaQjip5d7a+JyNVdfiWbIlji82pjfZJtQuHR6rs6ffpxI6XVSIcXhHrs9Xz9xUBFdQx+/YQYyab1srduhz9Ewnt87i9WOQKjlCaULMA27QxME/W914Nt2JSHDnnwUYK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qABzOXSh; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qABzOXSh"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso3291119a12.1
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Mar 2026 13:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774643047; cv=none;
        d=google.com; s=arc-20240605;
        b=MX2Z/GNuoqdaCewC/Dz/lc5pMWKJJ/dYmH3U3auVjoON3FH47IwvOE8eYz5x0ZVNJY
         16FAxVgG+pK3ECI3I1pREoqNh0F1NtTt/ImXtSMeVHiEmUr2iKI8mlvmcaOy5U0jqzQ5
         oNVJ+lE8fU4TImxM/UzvJTdGd90stFIQux4n5mMe8YVwBOdwloX1CzDsSeLg4sEgMdAj
         kYczEagD44tlfQMIkiIjrgQAJmY7pO4bMvcnrhnxOlhg25HYAx8rYXq/Wu0rTW2PkY0S
         PZFZ9i+SIx5HPeZQcnw5XSn2cvmJgvnP7vrz92qoAujyCEc9T4b383Qt1Jqg9oXd5u27
         kD0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9WeOtA6rLKd2feImk1nWk/a5NsEeM0kN8oqqyEId0bQ=;
        fh=HhIV/2Os4zFAXXC94N1iaDymPghfz/Vv41pP67rgcnI=;
        b=a53zPoF5Ml9AXHLWkr/n6uPG41zlmX5VoMIgUCqoVWYnVDCJqIOxh961UqmG+BQz5+
         gyrnax601EYcT1Nua6rKsuAgQsZCqosrJ1HyCWKCR2DIerjwJ2P12sdrdQNPHMS1RBqC
         ElH/BkYPDPwzkbKugtgmNvdX/h8/eyJUn6kD5FoRLlmu/qIDgWBk0MZzntoCXOr4jIhE
         t+/U9enmDE6u33CFes3dfZG1WM0oR8DegSwXr2aITn6bXw4SeE1iYAdJePRO0UV1ly2N
         R/upS/iCfLLcNh6UlFAYE/FS5g3ogBy0ZRUpbbBWyLv236MabSdJArPri/kBALJYzQpB
         8Q5Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774643047; x=1775247847; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9WeOtA6rLKd2feImk1nWk/a5NsEeM0kN8oqqyEId0bQ=;
        b=qABzOXSh9osIP5yTfItqRzdx0WYCzyKs4mBKAsziWEOWsmlGcMjVJr0nNrFjFozdjI
         r93tDDgqlfqXEBS9MAO19/+IQ74FsvCBchGo2GoqFu3glReqOxwX0iJHTJlrpgwcrX6Z
         /BID0tAM52o6axhJctumcZvPCjK6NDMjt5brGYbP5WVho+QNdmZzo9cCBL/Jrb0TNP9i
         zh9sOo9egHtw7pWbx2Ia+9AEKuvjQqyhtjxrAe5GLurumJDAdfcWau+NNXqOx9KLa41p
         3n4LVaAHGHz6WZZBxkMlY1IHrmALuK4VmaSAoS2vLc3yRIUOts/hnH8eh1XvzCduCLAH
         RLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774643047; x=1775247847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WeOtA6rLKd2feImk1nWk/a5NsEeM0kN8oqqyEId0bQ=;
        b=jqCuaGK1sh3OI8UgPBntoXpHJdmMfBH1NlBDoU5xUSvLlePAn0t1gLpXteDMxm9CGZ
         gnzZ/nISATfdz3I08ey2MFvXLoZll91Tl3U2O5zNEu27dgEHTsYbqehx5hzs/93VYoz5
         q/VW/nmbWzftYnGeUtDwNmcUT20WnaJXllngZm4+oF6PQzdmSXdoEs2OSIZNz44x26RX
         pFHzCReFojSOWhnbVuez/jWY8Qih0n41XsVnIvSJLTFcR5PGXGWiqEF0RqfkU6HaPiGL
         Wa2LcfCxk6W7TcoDsLb1tvZA0YtSuyBoeWN3RoTRbErIP4IrcU2HTkeJx/9KD9VwtR2W
         GZEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjpchotY2voewF0b4qulxfzRghiCEQRMyRRQvi2lAbUznwoa+L0CuFx/z0fEAM/PTgIFV9qx+2uj2I/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxK3HSTwTLl4eeOd6AE4dVjTHl4ecroJpky6TvCU/JEEaiqiv2a
	NCjflbZ/YaFG31Cl4DehJcX6JtAXWVN7nEQocu8Nepykmgc6Xe1jXtfqigoivHF2bS7OEKkOzob
	muTA5sUS8R3L1gJR/OJK2E2DYM0FRdhnmDIGSH3gZ1A==
X-Gm-Gg: ATEYQzwxXycakrGn0Jlfm4gS6R1NgHg+iRZo3lObVBx8g5K29PHfD01B/l7l+RiP7wl
	5XF58iW7jPZbQcfwuZNMefU3/8Qc+DLNyoxyQvtqRFT6/d77PpIdcvAnboXW+NcOaFR1pgMO8RE
	SbLOdCt2i6JOHSaklOtYI7rTJ5+SB77pcQWkvYymwcqv/I8d/E7fM3yABGKPHYX5hvw6yxyysaM
	k7UBhnFQ6yNQK6q1txn5uH2++fVVog5E4GAXD3qqLxqASqLQuk5y7tlTcpnKFEmNCStfOOf1+ml
	ED1bFEHP6zXXjYpZ8sSs7IOPHvVIPIFnpxcohQLv
X-Received: by 2002:a05:6402:46db:b0:66a:199d:138 with SMTP id
 4fb4d7f45d1cf-66b28c66cbemr2039826a12.20.1774643046839; Fri, 27 Mar 2026
 13:24:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260327184706.1600329-1-vladimir.oltean@nxp.com> <20260327184706.1600329-10-vladimir.oltean@nxp.com>
In-Reply-To: <20260327184706.1600329-10-vladimir.oltean@nxp.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 27 Mar 2026 20:23:54 +0000
X-Gm-Features: AQROBzCjrloDfUGTlNvOpQXdM4anVOjHCl2P0WQRB2XbIrpLYVg7AhYSjcExBJI
Message-ID: <CADrjBPqMwtrae7LB9A8xipg6R0rHGewe69awQ_jJnsf=2c=eTw@mail.gmail.com>
Subject: Re: [PATCH v6 phy-next 09/28] scsi: ufs: exynos: stop poking into
 struct phy guts
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Bart Van Assche <bvanassche@acm.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Chanho Park <chanho61.park@samsung.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Mar 2026 at 18:48, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
>
> The Exynos host controller driver is clearly a PHY consumer (gets the
> ufs->phy using devm_phy_get()), but pokes into the guts of struct phy
> to get the generic_phy->power_count.
>
> The UFS core (specifically ufshcd_link_startup()) may call the variant
> operation exynos_ufs_pre_link() -> exynos_ufs_phy_init() multiple times
> if the link startup fails and needs to be retried.
>
> However ufs-exynos shouldn't be doing what it's doing, i.e. looking at
> the generic_phy->power_count, because in the general sense of the API, a
> single Generic PHY may have multiple consumers. If ufs-exynos looks at
> generic_phy->power_count, there's no guarantee that this ufs-exynos
> instance is the one who previously bumped that power count. So it may be
> powering down the PHY on behalf of another consumer.
>
> The correct way in which this should be handled is ufs-exynos should
> *remember* whether it has initialized and powered up the PHY before, and
> power it down during link retries. Not rely on the power_count (which,
> btw, on the writer side is modified under &phy->mutex, but on the reader
> side is accessed unlocked). This is a discouraged pattern even if here
> it doesn't cause functional problems.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
> Acked-by: Alim Akhtar <alim.akhtar@samsung.com>
> Tested-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Peter Griffin <peter.griffin@linaro.org>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Chanho Park <chanho61.park@samsung.com>
>
> v5->v6: collect tags from Alim Akhtar
> v4->v5: collect tag, add "scsi: " prefix to commit title
> v3->v4: none
> v2->v3:
> - add Cc Chanho Park, author of commit 3d73b200f989 ("scsi: ufs:
>   ufs-exynos: Change ufs phy control sequence")
> v1->v2:
> - add better ufs->phy_powered_on handling in exynos_ufs_exit(),
>   exynos_ufs_suspend() and exynos_ufs_resume() which ensures we won't
>   enter a phy->power_count underrun condition
> ---
>  drivers/ufs/host/ufs-exynos.c | 24 ++++++++++++++++++++----
>  drivers/ufs/host/ufs-exynos.h |  1 +
>  2 files changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
> index 76fee3a79c77..274e53833571 100644
> --- a/drivers/ufs/host/ufs-exynos.c
> +++ b/drivers/ufs/host/ufs-exynos.c
> @@ -963,9 +963,10 @@ static int exynos_ufs_phy_init(struct exynos_ufs *ufs)
>
>         phy_set_bus_width(generic_phy, ufs->avail_ln_rx);
>
> -       if (generic_phy->power_count) {
> +       if (ufs->phy_powered_on) {
>                 phy_power_off(generic_phy);
>                 phy_exit(generic_phy);
> +               ufs->phy_powered_on = false;
>         }
>
>         ret = phy_init(generic_phy);
> @@ -979,6 +980,8 @@ static int exynos_ufs_phy_init(struct exynos_ufs *ufs)
>         if (ret)
>                 goto out_exit_phy;
>
> +       ufs->phy_powered_on = true;
> +
>         return 0;
>
>  out_exit_phy:
> @@ -1527,6 +1530,9 @@ static void exynos_ufs_exit(struct ufs_hba *hba)
>  {
>         struct exynos_ufs *ufs = ufshcd_get_variant(hba);
>
> +       if (!ufs->phy_powered_on)
> +               return;
> +
>         phy_power_off(ufs->phy);
>         phy_exit(ufs->phy);
>  }
> @@ -1728,8 +1734,10 @@ static int exynos_ufs_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
>         if (ufs->drv_data->suspend)
>                 ufs->drv_data->suspend(ufs);
>
> -       if (!ufshcd_is_link_active(hba))
> +       if (!ufshcd_is_link_active(hba) && ufs->phy_powered_on) {
>                 phy_power_off(ufs->phy);
> +               ufs->phy_powered_on = false;
> +       }
>
>         return 0;
>  }
> @@ -1737,9 +1745,17 @@ static int exynos_ufs_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
>  static int exynos_ufs_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  {
>         struct exynos_ufs *ufs = ufshcd_get_variant(hba);
> +       int err;
>
> -       if (!ufshcd_is_link_active(hba))
> -               phy_power_on(ufs->phy);
> +       if (!ufshcd_is_link_active(hba) && !ufs->phy_powered_on) {
> +               err = phy_power_on(ufs->phy);
> +               if (err) {
> +                       dev_err(hba->dev, "Failed to power on PHY: %pe\n",
> +                               ERR_PTR(err));
> +               } else {
> +                       ufs->phy_powered_on = true;
> +               }
> +       }
>
>         exynos_ufs_config_smu(ufs);
>         exynos_ufs_fmp_resume(hba);
> diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
> index abe7e472759e..683b9150e2ba 100644
> --- a/drivers/ufs/host/ufs-exynos.h
> +++ b/drivers/ufs/host/ufs-exynos.h
> @@ -227,6 +227,7 @@ struct exynos_ufs {
>         int avail_ln_rx;
>         int avail_ln_tx;
>         int rx_sel_idx;
> +       bool phy_powered_on;
>         struct ufs_pa_layer_attr dev_req_params;
>         struct ufs_phy_time_cfg t_cfg;
>         ktime_t entry_hibern8_t;
> --
> 2.43.0
>
